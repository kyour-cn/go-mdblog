package model

type ArticleClass struct {
	Id   uint `gorm:"type:int(11);PRIMARY_KEY"`
	Name string
	Sort int
}

//定义数据库表名
func (ArticleClass) TableName() string {
	return "article_class"
}
