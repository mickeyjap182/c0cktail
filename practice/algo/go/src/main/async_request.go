/**
 * go version 1.11
 */
package main
import (
    "fmt"
    "net/url"
    "net/http"
    "net/http/cookiejar"
    "time"
    "bytes"
    "strings"
    "io/ioutil"
)

const (
    GET = "GET"
    POST = "POST"
)
const (
    JSON = "application/json"
    FORM = "application/x-www-form-urlencoded"
)


func Send(req map[string]interface{}, i int, ch chan<-string) {
    start := time.Now()
    method := req["method"].(string)
    req_url := req["url"].(string)


    request, _ := http.NewRequest(
        method,
        req_url,
        nil,
    )
    // make request
    switch method{
    case GET:
          data := ""
          for k, v := range req["param"].(map[string]string) {
              if len(data) == 0 {
                data = "?"+k+"="+v
              } else {
                data = "&"+k+"="+v
              }
          }
          request, _ = http.NewRequest(
              method,
              req_url,
              nil,
          )
    case POST:
        switch req["type"].(string) {
        case JSON :
            jsonStr := `{`
            for k, v := range req["param"].(map[string]string) {
                if len(jsonStr) == 1 {
                  jsonStr = jsonStr+k+`:"`+v+`"`
                } else {
                  jsonStr = jsonStr+`,`+k+`:"`+v+`"`
                }
            }
            jsonStr = jsonStr + `}`
            request, _ = http.NewRequest(
                method,
                req_url,
                bytes.NewBuffer([]byte(jsonStr)),
            )
        case FORM :
            data := url.Values{}
            for k, v := range req["param"].(map[string]string) {
                if len(data) == 0 {
                  data.Set(k,v)
                } else {
                  data.Add(k,v)
                }
            }
            request, _ = http.NewRequest(
                method,
                req_url,
                strings.NewReader(data.Encode()),
            )
        }
        request.Header.Set("Content-Type", req["type"].(string))
    default: // other http methods
    }

    // resp, _ := http.Get(req["url"].(string))
    client := &http.Client{}
    resp, _ := client.Do(request)
    secs := time.Since(start).Seconds()
    body, _ := ioutil.ReadAll(resp.Body)
    defer resp.Body.Close()
    ch <- fmt.Sprintf("request_list_id:%d %.3f elapsed with response length: %d %s : %s", i, secs , len(body), req["method"].(string), req_url)
}

func main() {
    cookieJar, _ := cookiejar.New(nil)
    // Fix this list as you like.
    urls := [] map[string]interface{}{
        map[string]interface{}{"url":"http://127.0.0.1:7000/", "method":GET, "type": "", "param": map[string]string{"a":"2","b":"3"}},
        map[string]interface{}{"url":"http://127.0.0.1:7000/", "method":POST, "type": JSON, "param": map[string]string{"article":"medical","id":"13"}, "cookie": cookieJar},
        map[string]interface{}{"url":"http://127.0.0.1:7000/", "method":POST, "type": FORM, "param": map[string]string{}},
        map[string]interface{}{"url":"http://127.0.0.1:7000/", "method":GET, "type": "", "param": map[string]string{}},
        map[string]interface{}{"url":"http://127.0.0.1:7000/", "method":GET, "type": "", "param": map[string]string{}},
    }
    start := time.Now()
    ch := make(chan string) // async data link channel for output.
    for i, url := range urls{
        // issue concurrent request by goroutine.
        go Send(url, i, ch)
    }
    for range urls{
        fmt.Println(<-ch)
    }
    fmt.Printf("Total:%.2fs elapsed\n", time.Since(start).Seconds())

}
