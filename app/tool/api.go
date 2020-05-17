package tool

import (
	"github.com/kyour-cn/gourd/utils/cache"
	"github.com/kyour-cn/gourd/utils/gut"
)

//获取每日一句
func ApiGetDaysent() interface{} {

	data, ok := cache.Get("api_ds_iciba")
	if ok {
		//log.Printf("缓存数据：%v", data)
		return data
	}

	//获取json ?date=Ymd
	body := gut.HttpGet("http://open.iciba.com/dsapi/")

	data, err := gut.JsonDe(body)
	if err != nil {
		return ""
	}
	//log.Printf("获取数据：%v", data)

	cache.Set("api_ds_iciba", data, 3600)

	return data

}
