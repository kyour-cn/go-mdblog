package model

import (
	"github.com/jinzhu/gorm"
	"github.com/kyour-cn/gourd/server/db"
)

type Article struct {
	Id        uint `gorm:"type:int(11);PRIMARY_KEY"`
	Uid       uint
	Addtime   uint
	Edittime  uint
	MsgNum    uint
	Pv        uint
	Star      uint
	Title     string
	Introduce string
	Class     uint
	Tag       string
	Cover     string
}

//定义数据库表名
func (Article) TableName() string {
	return "article"
}

//全部数据
type ArticleAll struct {
	Article
	Content string
}

//获取文章主体
func (Article) GetContent(id uint) *ArticleAll {

	a := ArticleAll{}

	db.Conn().Where("id = ?", id).
		Find(&a)

	return &a

}

//pv自增
func (a *Article) PvAdd(id uint) {

	db.Conn().Model(&a).Where("id = ?", id).
		Update("pv", gorm.Expr("pv + 1"))

}

//更新数据
func (a *ArticleAll) Update(data map[string]interface{}) {

	conn := db.Conn()

	conn.Model(&a).Updates(data)
}
