package api

import (
	"math/rand"
	"net/http"
	"strconv"
)


"github.com/labstack/echo"
)

func MonteCarlo() string {
	var num, count int
	num = 10000000

	count = 0

	for i := 0; i < num; i++ {
		x := rand.Float64()
		y := rand.Float64()

		if x*x+y*y <= 1.0 {
			count++
		}
	}

	var p float64
	p = 4.0 * float64(count) / float64(num)

	res := strconv.FormatFloat(p, 'f', 4, 64)
	return res
}

func main() {
	e := echo.New()

	e.GET("/montecarlo", func(c echo.Context) error {
		return c.String(http.StatusOK, MonteCarlo())
	})
	e.Start(":8000")
}
