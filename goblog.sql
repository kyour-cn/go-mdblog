/*
 Navicat Premium Data Transfer

 Source Server         : 华为服务器
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : www.kyour.cn:8306
 Source Schema         : goblog

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 17/05/2020 10:20:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `msg_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数量',
  `pv` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `star` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏量',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `introduce` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '500字简介',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `class` int(11) NOT NULL DEFAULT 0 COMMENT '分类',
  `tag` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签id\",\"分割，最多3个',
  `cover` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `del_at` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 0, 1588951013, 0, 48, 1, '测试文章内容', '测试1', '# Editor.md\r\n\r\n![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)\r\n\r\n![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)\r\n\r\n----\r\n\r\n~~删除线~~ <s>删除线（开启识别HTML标签时）</s>\r\n*斜体字*      _斜体字_\r\n**粗体**  __粗体__\r\n***粗斜体*** ___粗斜体___\r\n\r\n上标：X<sub>2</sub>，下标：O<sup>2</sup>\r\n\r\n**缩写(同HTML的abbr标签)**\r\n\r\n> 即更长的单词或短语的缩写形式，前提是开启识别HTML标签时，已默认开启\r\n\r\nThe <abbr title=\"Hyper Text Markup Language\">HTML</abbr> specification is maintained by the <abbr title=\"World Wide Web Consortium\">W3C</abbr>.\r\n\r\n### 引用 Blockquotes\r\n\r\n> 引用文本 Blockquotes\r\n\r\n引用的行内混合 Blockquotes\r\n                    \r\n> 引用：如果想要插入空白换行`即<br />标签`，在插入处先键入两个以上的空格然后回车即可，[普通链接](http://localhost/)。\r\n\r\n### 锚点与链接 Links\r\n\r\n[普通链接](http://localhost/)\r\n\r\n[普通链接带标题](http://localhost/ \"普通链接带标题\")\r\n\r\n直接链接：<https://github.com>\r\n\r\n[锚点链接][anchor-id] \r\n\r\n[anchor-id]: http://www.this-anchor-link.com/\r\n\r\n[mailto:test.test@gmail.com](mailto:test.test@gmail.com)\r\n\r\nGFM a-tail link @pandao  邮箱地址自动链接 test.test@gmail.com  www@vip.qq.com\r\n\r\n> @pandao\r\n\r\n### 多语言代码高亮 Codes\r\n\r\n#### 行内代码 Inline code\r\n\r\n执行命令：`npm install marked`\r\n\r\n#### 缩进风格\r\n\r\n即缩进四个空格，也做为实现类似 `<pre>` 预格式化文本 ( Preformatted Text ) 的功能。\r\n\r\n    <?php\r\n        echo \"Hello world!\";\r\n    ?>\r\n    \r\n预格式化文本：\r\n\r\n    | First Header  | Second Header |\r\n    | ------------- | ------------- |\r\n    | Content Cell  | Content Cell  |\r\n    | Content Cell  | Content Cell  |\r\n\r\n#### JS代码　\r\n\r\n```javascript\r\nfunction test() {\r\n	console.log(\"Hello world!\");\r\n}\r\n \r\n(function(){\r\n    var box = function() {\r\n        return box.fn.init();\r\n    };\r\n\r\n    box.prototype = box.fn = {\r\n        init : function(){\r\n            console.log(\'box.init()\');\r\n\r\n			return this;\r\n        },\r\n\r\n		add : function(str) {\r\n			alert(\"add\", str);\r\n\r\n			return this;\r\n		},\r\n\r\n		remove : function(str) {\r\n			alert(\"remove\", str);\r\n\r\n			return this;\r\n		}\r\n    };\r\n    \r\n    box.fn.init.prototype = box.fn;\r\n    \r\n    window.box =box;\r\n})();\r\n\r\nvar testBox = box();\r\ntestBox.add(\"jQuery\").remove(\"jQuery\");\r\n```\r\n\r\n#### HTML 代码 HTML codes\r\n\r\n```html\r\n<!DOCTYPE html>\r\n<html>\r\n    <head>\r\n        <mate charest=\"utf-8\" />\r\n        <meta name=\"keywords\" content=\"Editor.md, Markdown, Editor\" />\r\n        <title>Hello world!</title>\r\n        <style type=\"text/css\">\r\n            body{font-size:14px;color:#444;font-family: \"Microsoft Yahei\", Tahoma, \"Hiragino Sans GB\", Arial;background:#fff;}\r\n            ul{list-style: none;}\r\n            img{border:none;vertical-align: middle;}\r\n        </style>\r\n    </head>\r\n    <body>\r\n        <h1 class=\"text-xxl\">Hello world!</h1>\r\n        <p class=\"text-green\">Plain text</p>\r\n    </body>\r\n</html>\r\n```\r\n\r\n### 图片 Images\r\n\r\nImage:\r\n\r\n![](https://pandao.github.io/editor.md/examples/images/4.jpg)\r\n\r\n> Follow your heart.\r\n\r\n![](https://pandao.github.io/editor.md/examples/images/8.jpg)\r\n\r\n> 图为：厦门白城沙滩\r\n\r\n图片加链接 (Image + Link)：\r\n\r\n[![](https://pandao.github.io/editor.md/examples/images/7.jpg)](https://pandao.github.io/editor.md/images/7.jpg \"李健首张专辑《似水流年》封面\")\r\n\r\n> 图为：李健首张专辑《似水流年》封面\r\n                \r\n----\r\n\r\n### 列表 Lists\r\n\r\n#### 无序列表（减号）Unordered Lists (-)\r\n                \r\n- 列表一\r\n- 列表二\r\n- 列表三\r\n     \r\n#### 无序列表（星号）Unordered Lists (*)\r\n\r\n* 列表一\r\n* 列表二\r\n* 列表三\r\n\r\n#### 无序列表（加号和嵌套）Unordered Lists (+)\r\n                \r\n+ 列表一\r\n+ 列表二\r\n    + 列表二-1\r\n    + 列表二-2\r\n    + 列表二-3\r\n+ 列表三\r\n    * 列表一\r\n    * 列表二\r\n    * 列表三\r\n\r\n#### 有序列表 Ordered Lists (-)\r\n                \r\n1. 第一行\r\n2. 第二行\r\n3. 第三行\r\n\r\n#### GFM task list\r\n\r\n- [x] GFM task list 1\r\n- [x] GFM task list 2\r\n- [ ] GFM task list 3\r\n    - [ ] GFM task list 3-1\r\n    - [ ] GFM task list 3-2\r\n    - [ ] GFM task list 3-3\r\n- [ ] GFM task list 4\r\n    - [ ] GFM task list 4-1\r\n    - [ ] GFM task list 4-2\r\n                \r\n----\r\n                    \r\n### 绘制表格 Tables\r\n\r\n| 项目        | 价格   |  数量  |\r\n| --------   | -----:  | :----:  |\r\n| 计算机      | $1600   |   5     |\r\n| 手机        |   $12   |   12   |\r\n| 管线        |    $1    |  234  |\r\n                    \r\nFirst Header  | Second Header\r\n------------- | -------------\r\nContent Cell  | Content Cell\r\nContent Cell  | Content Cell \r\n\r\n| First Header  | Second Header |\r\n| ------------- | ------------- |\r\n| Content Cell  | Content Cell  |\r\n| Content Cell  | Content Cell  |\r\n\r\n| Function name | Description                    |\r\n| ------------- | ------------------------------ |\r\n| `help()`      | Display the help window.       |\r\n| `destroy()`   | **Destroy your computer!**     |\r\n\r\n| Left-Aligned  | Center Aligned  | Right Aligned |\r\n| :------------ |:---------------:| -----:|\r\n| col 3 is      | some wordy text | $1600 |\r\n| col 2 is      | centered        |   $12 |\r\n| zebra stripes | are neat        |    $1 |\r\n\r\n| Item      | Value |\r\n| --------- | -----:|\r\n| Computer  | $1600 |\r\n| Phone     |   $12 |\r\n| Pipe      |    $1 |\r\n                \r\n----\r\n\r\n#### 特殊符号 HTML Entities Codes\r\n\r\n&copy; &  &uml; &trade; &iexcl; &pound;\r\n&amp; &lt; &gt; &yen; &euro; &reg; &plusmn; &para; &sect; &brvbar; &macr; &laquo; &middot; \r\n\r\nX&sup2; Y&sup3; &frac34; &frac14;  &times;  &divide;   &raquo;\r\n\r\n18&ordm;C  &quot;  &apos;\r\n\r\n[========]\r\n\r\n### Emoji表情 :smiley:\r\n\r\n> Blockquotes :star:\r\n\r\n#### GFM task lists & Emoji & fontAwesome icon emoji & editormd logo emoji :editormd-logo-5x:\r\n\r\n- [x] :smiley: @mentions, :smiley: #refs, [links](), **formatting**, and <del>tags</del> supported :editormd-logo:;\r\n- [x] list syntax required (any unordered or ordered list supported) :editormd-logo-3x:;\r\n- [x] [ ] :smiley: this is a complete item :smiley:;\r\n- [ ] []this is an incomplete item [test link](#) :fa-star: @pandao; \r\n- [ ] [ ]this is an incomplete item :fa-star: :fa-gear:;\r\n    - [ ] :smiley: this is an incomplete item [test link](#) :fa-star: :fa-gear:;\r\n    - [ ] :smiley: this is  :fa-star: :fa-gear: an incomplete item [test link](#);\r\n \r\n#### 反斜杠 Escape\r\n\r\n\\*literal asterisks\\*\r\n\r\n[========]\r\n            \r\n### 科学公式 TeX(KaTeX)\r\n\r\n$$E=mc^2$$\r\n\r\n行内的公式$$E=mc^2$$行内的公式，行内的$$E=mc^2$$公式。\r\n\r\n$$x > y$$\r\n\r\n$$\\(\\sqrt{3x-1}+(1+x)^2\\)$$\r\n                    \r\n$$\\sin(\\alpha)^{\\theta}=\\sum_{i=0}^{n}(x^i + \\cos(f))$$\r\n\r\n多行公式：\r\n\r\n```math\r\n\\displaystyle\r\n\\left( \\sum\\_{k=1}^n a\\_k b\\_k \\right)^2\r\n\\leq\r\n\\left( \\sum\\_{k=1}^n a\\_k^2 \\right)\r\n\\left( \\sum\\_{k=1}^n b\\_k^2 \\right)\r\n```\r\n\r\n```katex\r\n\\displaystyle \r\n    \\frac{1}{\r\n        \\Bigl(\\sqrt{\\phi \\sqrt{5}}-\\phi\\Bigr) e^{\r\n        \\frac25 \\pi}} = 1+\\frac{e^{-2\\pi}} {1+\\frac{e^{-4\\pi}} {\r\n        1+\\frac{e^{-6\\pi}}\r\n        {1+\\frac{e^{-8\\pi}}\r\n         {1+\\cdots} }\r\n        } \r\n    }\r\n```\r\n\r\n```latex\r\nf(x) = \\int_{-\\infty}^\\infty\r\n    \\hat f(\\xi)\\,e^{2 \\pi i \\xi x}\r\n    \\,d\\xi\r\n```\r\n\r\n### 分页符 Page break\r\n\r\n> Print Test: Ctrl + P\r\n\r\n[========]\r\n\r\n### 绘制流程图 Flowchart\r\n\r\n```flow\r\nst=>start: 用户登陆\r\nop=>operation: 登陆操作\r\ncond=>condition: 登陆成功 Yes or No?\r\ne=>end: 进入后台\r\n\r\nst->op->cond\r\ncond(yes)->e\r\ncond(no)->op\r\n```\r\n\r\n[========]\r\n                    \r\n### 绘制序列图 Sequence Diagram\r\n                    \r\n```seq\r\nAndrew->China: Says Hello \r\nNote right of China: China thinks\\nabout it \r\nChina-->Andrew: How are you? \r\nAndrew->>China: I am good thanks!\r\n```\r\n\r\n### End', 1, '', 'http://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.png?http://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.pnghttp://blog.kyour.cn/uploahttp://blog.kyour.cn/uplo', 0);
INSERT INTO `article` VALUES (2, 1, 2, 1589113023, 0, 251, 0, '如何用Gourd框架快速开发应用？', 'Gourd是一个Golang互联网开发框架，它的用途不仅仅只是Web领域，现在就让我们一起来探索吧！', '## 如何用Gourd框架快速开发应用？\r\n\r\n答：不知道\r\n', 1, '', 'http://blog.kyour.cn/uploads/article/20200503/5eae7ccfc5d78.png', 0);
INSERT INTO `article` VALUES (5, 1, 0, 1588951290, 0, 8, 0, '5545666', '55', '```\r\n<script>\r\nalert(\"12333\")\r\n</script>```\r\n\r\n\r\ndasdasd', 1, '', '', 0);
INSERT INTO `article` VALUES (6, 1, 0, 0, 0, 0, 0, '66', '66', NULL, 1, '', 'f', 0);
INSERT INTO `article` VALUES (7, 1, 0, 1589179716, 0, 3, 0, '77fdfdsfdsgfdfgfhgf', '77', 'vgbfdg ', 2, '', 'ghfgf', 0);
INSERT INTO `article` VALUES (8, 1, 0, 5484512, 0, 0, 0, '88', '88', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (9, 1, 0, 0, 0, 0, 0, '99', '99', NULL, 1, '', 'gh', 0);
INSERT INTO `article` VALUES (10, 1, 0, 5484512, 0, 0, 0, '00', '110', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (11, 1, 0, 5484512, 0, 0, 0, '11', '111', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (12, 1, 0, 0, 0, 3, 0, '12', '112', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (18, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (19, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (20, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (21, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (22, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (23, 1, 0, 0, 0, 2, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (24, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (25, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (26, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (27, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (28, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (29, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (30, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (31, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (32, 1, 0, 1589113936, 0, 11, 0, '阿萨大大十大打算', '', '同仁堂', 3, '', '', 0);
INSERT INTO `article` VALUES (33, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (34, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (35, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (36, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (37, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (38, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (39, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (40, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (41, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (42, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (43, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (44, 1, 0, 0, 0, 0, 0, '', '', NULL, 2, '', '', 0);
INSERT INTO `article` VALUES (45, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (46, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (47, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (48, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (49, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (50, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (51, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (52, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (53, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (54, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (55, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (56, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (57, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (58, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (59, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (60, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (61, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (62, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (63, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (64, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (65, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (66, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (67, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (68, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (69, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (70, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (71, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (72, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (73, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (74, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (75, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (76, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (77, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (78, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (79, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (80, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (81, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (82, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (83, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (84, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (85, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (86, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (87, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (88, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (89, 1, 0, 0, 0, 0, 0, '', '', NULL, 1, '', '', 0);
INSERT INTO `article` VALUES (90, 1, 1589113966, 1589113966, 0, 82, 0, '测试mysql1', '士大夫', NULL, 3, '', '', 0);

-- ----------------------------
-- Table structure for article_class
-- ----------------------------
DROP TABLE IF EXISTS `article_class`;
CREATE TABLE `article_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `del_at` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除标识',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_class
-- ----------------------------
INSERT INTO `article_class` VALUES (1, 'PHP', 0, 1);
INSERT INTO `article_class` VALUES (2, 'Go', 0, 1);
INSERT INTO `article_class` VALUES (3, 'Mysql', 0, 1);

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章Id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户Id',
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间',
  `at` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复评论id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES (1, 0, '防守打法的', 1, 1589184074, 0);
INSERT INTO `article_comment` VALUES (2, 90, '防守打法的v', 2, 1589184146, 0);
INSERT INTO `article_comment` VALUES (3, 0, '电放费', 1, 1589184187, 0);
INSERT INTO `article_comment` VALUES (4, 90, '打大萨达啥打所', 1, 1589184220, 0);
INSERT INTO `article_comment` VALUES (5, 0, '<img src=\"/static/images/arclist/21.gif\" border=\"0\" />dasds', 1, 1589185089, 0);
INSERT INTO `article_comment` VALUES (6, 90, 'dsfedf', 1, 1589185683, 0);
INSERT INTO `article_comment` VALUES (7, 90, '大萨达啥', 1, 1589187833, 0);
INSERT INTO `article_comment` VALUES (8, 90, '测试1233333', 1, 1589187843, 0);
INSERT INTO `article_comment` VALUES (9, 90, 'hgfhfhfhf', 1, 1589251163, 0);

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `del_at` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `click` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `sort` tinyint(5) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of column
-- ----------------------------
INSERT INTO `column` VALUES (1, '管理系统', '/user', 0);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中文名称',
  `tag` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签别名',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '值',
  `type` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '数据类型，用于表单显示',
  `class` int(11) NOT NULL COMMENT '分类Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, '网站名称', 'site_name', 'Gourd博客', 'input', 1);
INSERT INTO `setting` VALUES (2, '网站标题', 'site_title', 'Go语言框架开发', 'input', 1);
INSERT INTO `setting` VALUES (3, '网站logo', 'site_logo', '', 'input', 1);
INSERT INTO `setting` VALUES (4, '联系站长', 'contact', 'Email:<br /><a href=\"mailto:kyour@vip.qq.com\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"kyour@vip.qq.com\">kyour@vip.qq.com</a>', 'input', 1);
INSERT INTO `setting` VALUES (5, '统计代码', 'statistics', '', 'textarea', 1);
INSERT INTO `setting` VALUES (6, '备案号', 'site_icp', '&copy; 2020 <a href=\"\">kyour.cn</a> &nbsp; <a href=\"http://www.beian.miit.gov.cn/\">蜀ICP备20006619号-1</a>', 'input', 1);

-- ----------------------------
-- Table structure for setting_class
-- ----------------------------
DROP TABLE IF EXISTS `setting_class`;
CREATE TABLE `setting_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标识符',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '中文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_class
-- ----------------------------
INSERT INTO `setting_class` VALUES (1, 'site', '站点信息');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nike_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `emali` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qq号',
  `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码md5',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像地址',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1:普通用户，2：...',
  `vip` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'vip等级...',
  `admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否管理员',
  `del_at` int(11) NOT NULL DEFAULT 0 COMMENT '删除 标识',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'kyour', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '', 0, 0, 1, 0);
INSERT INTO `user` VALUES (2, 'kyour1', '', 'kyour@qq.com', '1270701414', 'e10adc3949ba59abbe56e057f20f883e', 'http://q1.qlogo.cn/g?b=qq&nk=1270701414&s=100&t=', 0, 0, 0, 0);
INSERT INTO `user` VALUES (3, 'kyour2', '', 'kyour@qq.com', '1270701414', 'b35fb43ca312b26120e2c33403d36029', 'http://q1.qlogo.cn/g?b=qq&nk=1270701414&s=100&t=', 0, 0, 0, 0);
INSERT INTO `user` VALUES (4, 'kyour3', '', 'kyour@qq.com', '1270701414', 'e10adc3949ba59abbe56e057f20f883e', 'http://q1.qlogo.cn/g?b=qq&nk=1270701414&s=100&t=', 0, 0, 0, 0);
INSERT INTO `user` VALUES (5, 'kwwww', '', 'kyour', '2656455', '97dc73cfc6e73d94bad60a672bc8dcb2', 'http://q1.qlogo.cn/g?b=qq&nk=2656455&s=100&t=', 0, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
