package model

type ArticleComment struct {
	Id      uint `gorm:"PRIMARY_KEY"`
	Aid     uint
	Uid     uint
	User    User `gorm:"ForeignKey:Uid;AssociationForeignKey:Uid"` // 使用Uid作为外键
	Time    uint
	Content string
	At      uint
}

//定义数据库表名
func (ArticleComment) TableName() string {
	return "article_comment"
}
