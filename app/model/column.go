package model

import (
	"github.com/kyour-cn/gourd/server/db"
	"github.com/kyour-cn/gourd/utils/cache"
)

type Column struct {
	Id   uint `gorm:"type:int(11);PRIMARY_KEY"`
	Name string
	Url  string
	Sort int
}

//定义数据库表名
func (Column) TableName() string {
	return "column"
}

//获取栏目列表
func (c Column) GetAll() (arr []Column) {

	cache_data, ok := cache.Get("cache_column_arr")

	if ok {
		arr = cache_data.([]Column)
		return
	}
	conn := db.Conn()

	//查询数据
	conn.Find(&arr)

	cache.Set("cache_column_arr", arr, 60)

	return

}
