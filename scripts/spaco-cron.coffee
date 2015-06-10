# Description:
#   定期発言用のスクリプト
#
# Notes:
#   主にすぱこーのセリフから拝借
#   http://pronama.azurewebsites.net/category/web-comic/

Cron = require('cron').CronJob

word_list = [
  'プログラミング生放送！'
  '私、暮井慧。よろしくね'
  'いやー ちーちゃん黒髪キレイだから和服が似合うかな〜って http://pronama.azurewebsites.net/2014/01/01/web-comic-spaco-0101/'
  'わー！ありがとー！ちーちゃん大好き♪ http://pronama.azurewebsites.net/2014/01/11/web-comic-spaco-0111/'
  'せっかくカラオケに来たんだから本場の英語で洋楽歌ってよ！ http://pronama.azurewebsites.net/2014/02/01/web-comic-spaco-0201/'
  'うわー!?野太い〜ッ！なんか恥ずかしいよ〜 http://pronama.azurewebsites.net/2014/02/01/web-comic-spaco-0201/'
  'カードか〜いいなぁ〜今ちょうど欲しいグラフィックカードがあって〜 http://pronama.azurewebsites.net/2014/02/14/web-comic-spaco-0214/'
  'へっ!?ああ……うん！何も作ってないよ！ http://pronama.azurewebsites.net/2014/02/14/web-comic-spaco-0214/'
  'ぅぅ……そんな目で見ないで……分かったよ〜 http://pronama.azurewebsites.net/2014/02/14/web-comic-spaco-0214/'
  'これでも頑張ったんだよぉ…… http://pronama.azurewebsites.net/2014/02/14/web-comic-spaco-0214/'
  'どうしたの？そんなに根を詰めちゃって http://pronama.azurewebsites.net/2014/03/01/web-comic-spaco-0301/'
  'まぁまぁ 外の空気に触れてリフレッシュしよ？ http://pronama.azurewebsites.net/2014/03/01/web-comic-spaco-0301/'
  '見てみて！すっごい綺麗な青空！いやな事なんて吹っ飛ぶでしょ？ http://pronama.azurewebsites.net/2014/03/01/web-comic-spaco-0301/'
  '勘違いといえば私もちっちゃい頃『ビート』と『ビット』をごっちゃにしてたなー8ビートの曲はファミコン音源かなーとか思ってたりしてたんだよ http://pronama.azurewebsites.net/2014/03/01/web-comic-spaco-0301/'
  '電子機器……？あ！そうだ！ http://pronama.azurewebsites.net/2014/03/14/web-comic-spaco-0314/'
  'ちーちゃん！お返しのチョコ作ったからもらってね！3Dプリンターを使ってみたんだー http://pronama.azurewebsites.net/2014/03/14/web-comic-spaco-0314/'
  'そうだよ！ウサ耳の方がかわいいよ！ http://pronama.azurewebsites.net/2014/03/14/web-comic-spaco-0314/'
  'ごめん〜遅くなっちゃったー天気良かったからサッカー部に混ぜてもらってたんだー http://pronama.azurewebsites.net/2014/05/02/web-comic-spaco-0502/'
  'うん、決まってるよ〜PC組み立てて……プログラム組んで…… http://pronama.azurewebsites.net/2014/05/02/web-comic-spaco-0502/'
  'やっぱちーちゃんの料理サイコーだね http://pronama.azurewebsites.net/2014/05/16/web-comic-spaco-0516/'
  '今日から夏服！ http://pronama.azurewebsites.net/2014/06/08/web-comic-spaco-0608/'
  'てるてる坊主つるしたのにな〜数が足りないのか…… http://pronama.azurewebsites.net/2014/06/08/web-comic-spaco-0608/'
  'これだけあれば雨もやむんじゃないかな？ http://pronama.azurewebsites.net/2014/06/08/web-comic-spaco-0608/'
  'いっそどこが勝つか勝敗シミュレーションプログラム作ってみようよ！ http://pronama.azurewebsites.net/2014/06/24/web-comic-spaco-0624/'
  'そうだね〜いろいろ楽しい機能もつけたから…… http://pronama.azurewebsites.net/2014/06/24/web-comic-spaco-0624/'
  'チケットあげた！お父さんすごく喜んでくれたよーこの前のプログラムのバグ修正のアサイン！ http://pronama.azurewebsites.net/2014/06/24/web-comic-spaco-0624/'
  '試着してみよーよ！ http://pronama.azurewebsites.net/2014/07/08/web-comic-spaco-13/'
  'お〜！ちーちゃんは最適化しなくても大丈夫だね！ダイエット不要ってこと http://pronama.azurewebsites.net/2014/07/08/web-comic-spaco-13/'
  'うんうん http://pronama.azurewebsites.net/2014/07/08/web-comic-spaco-13/'
  'ちーちゃんち、喫茶店だもんねー http://pronama.azurewebsites.net/2014/07/08/web-comic-spaco-13/'
  'ちなみに私も夏季限定の……アプリを開発したよ http://pronama.azurewebsites.net/2014/07/08/web-comic-spaco-13/'
  '蚊を倒す練習用にゲームを作ったよ！ http://pronama.azurewebsites.net/2014/07/22/web-comic-spaco-14/'
  'お願いがいっぱいあったから作っちゃった……願い事が定期的に切り替わるアプリ！ http://pronama.azurewebsites.net/2014/07/22/web-comic-spaco-14/'
  'そうだろうと思って体の内側から涼しくなるようにホラーゲームを作ってみたよ！ http://pronama.azurewebsites.net/2014/08/05/web-comic-spaco-15/'
  'あの感動をもう一度！ http://pronama.azurewebsites.net/2014/08/21/web-comic-spaco-16/'
  'そんなわけで擬似花火体験ができるアプリをつくったよ！ http://pronama.azurewebsites.net/2014/08/21/web-comic-spaco-16/'
  '大音量のリアルなサウンドで花火の臨場感を演出！ http://pronama.azurewebsites.net/2014/08/21/web-comic-spaco-16/'
  '夏といえば甲子園だよね！ http://pronama.azurewebsites.net/2014/08/21/web-comic-spaco-16/'
  'ということでスマホのカメラで投球の軌道を予想するアプリを作ったよ！これでホームランも夢じゃない！ http://pronama.azurewebsites.net/2014/08/21/web-comic-spaco-16/'
  'そこで芸術と読書の秋を同時に楽しめるアプリを開発したよ！ http://pronama.azurewebsites.net/2014/09/08/web-comic-spaco-17/'
  '食べながら走ってこれを読めばいいんだよ！ http://pronama.azurewebsites.net/2014/09/08/web-comic-spaco-17/'
  'わぁ！月がまんまる！中秋の名月だね！ http://pronama.azurewebsites.net/2014/09/08/web-comic-spaco-17/'
  '……私にはパソコンを組み立ててる人に見えるかな http://pronama.azurewebsites.net/2014/09/08/web-comic-spaco-17/'
  'ふぃーちゃんが勝てるようなの入れてるからね！情研ならではのしろものだよ！ http://pronama.azurewebsites.net/2014/10/05/web-comic-spaco-18/'
  '私も自作したよ http://pronama.azurewebsites.net/2014/10/05/web-comic-spaco-18/'
  'じゃーん！お弁当です http://pronama.azurewebsites.net/2014/10/05/web-comic-spaco-18/'
  '私は猫娘だにょ！ http://pronama.azurewebsites.net/2014/10/23/web-comic-spaco-19/'
  'そしてジャック・オー・ランタンくん！ http://pronama.azurewebsites.net/2014/10/23/web-comic-spaco-19/'
  'そんなふぃーちゃんの為にハロウィンなアプリを作ったよ！ http://pronama.azurewebsites.net/2014/10/23/web-comic-spaco-19/'
  'ハロウィンコスを気軽に体験できるカメラアプリだよ！ http://pronama.azurewebsites.net/2014/10/23/web-comic-spaco-19/'
  'ダブル猫耳ができるよ！ http://pronama.azurewebsites.net/2014/10/23/web-comic-spaco-19/'
  'そうだ！プログラムの研究も兼ねて似顔絵アプリ作ろうよ！ http://pronama.azurewebsites.net/2014/11/03/web-comic-spaco-20/'
  'やっぱプログラム考えるの楽しいね〜！ http://pronama.azurewebsites.net/2014/11/03/web-comic-spaco-20/'
  'できたよ！ http://pronama.azurewebsites.net/2014/11/03/web-comic-spaco-20/'
  'じゃあ暖まれるスマホアプリを作ろう！ http://pronama.azurewebsites.net/2014/11/15/web-comic-spaco-21/'
  'できたよ！ http://pronama.azurewebsites.net/2014/11/15/web-comic-spaco-21/'
  'あまりの負荷に超発熱！ http://pronama.azurewebsites.net/2014/11/15/web-comic-spaco-21/'
  'そうだ！こうやって負荷のかかるプログラムを組んで……一斉起動！ http://pronama.azurewebsites.net/2014/11/15/web-comic-spaco-21/'
  'うん！ふぃーちゃん見てみて http://pronama.azurewebsites.net/2014/12/04/web-comic-spaco-22/'
  'PCに雪を被せるだけだから簡単だったよ http://pronama.azurewebsites.net/2014/12/04/web-comic-spaco-22/'
  'ねー！ http://pronama.azurewebsites.net/2014/12/04/web-comic-spaco-22/'
  '情研もイルミネーションで飾ってみない？ http://pronama.azurewebsites.net/2014/12/04/web-comic-spaco-22/'
  '情研らしいツリーをと思ったんだけどなんか地味になっちゃったね…… http://pronama.azurewebsites.net/2014/12/04/web-comic-spaco-22/'
  '今年ももう終わりだねぇ http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  '一応クリスマスらしいアプリを作ったよ。私達には必要ないけど…… http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  'ビデオ通話に相性占いラブラブツーショット機能等もろもろ詰め込んで http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  'お！彼氏いたんだね！ http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  '彼氏じゃなかったの？ http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  '今年もアプリを作ってばかりの良い一年だったね http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  '年越しアプリを作ったから最後もアプリで締めるよ。108回鳴らさないと終われないからねそのアプリ http://pronama.azurewebsites.net/2014/12/23/web-comic-spaco-23/'
  'やっほーふぃーちゃん！！いきなりだけどクイズです！！ http://pronama.azurewebsites.net/2015/01/16/web-comic-spaco-25/'
  'ということで成人式にお役立ちなアプリを作ったんだよ http://pronama.azurewebsites.net/2015/01/16/web-comic-spaco-25/'
  '警察ご用達「ハメ外すな危険！酒飲んで暴れている姿を見てるぞ！アプリ」だよ http://pronama.azurewebsites.net/2015/01/16/web-comic-spaco-25/'
  '福は内〜！福は内〜！ http://pronama.azurewebsites.net/2015/02/02/web-comic-spaco-26/'
  'しかも！これにはなんと撮った写真を自動でツイッターにアップする機能が http://pronama.azurewebsites.net/2015/02/02/web-comic-spaco-26/'
  '恵方巻きを食べよう！ http://pronama.azurewebsites.net/2015/02/02/web-comic-spaco-26/'
  'おいしかったしまあいいよね http://pronama.azurewebsites.net/2015/02/02/web-comic-spaco-26/'
  'その年の恵方がわかる毎年１回しか使えないアプリを作ったよ！ http://pronama.azurewebsites.net/2015/02/02/web-comic-spaco-26/'
  '見て見て！前に作ったホラーゲーム「恐怖の林」がすごい人気みたい！ http://pronama.azurewebsites.net/2015/02/15/web-comic-spaco-27/'
  '３月３日は耳の日だね http://pronama.azurewebsites.net/2015/03/02/web-comic-spaco-28/'
  'にゃうりんがる首輪付きだよ！ http://pronama.azurewebsites.net/2015/03/02/web-comic-spaco-28/'
  'にゃうりんがる首輪付きや！ http://pronama.azurewebsites.net/2015/03/13/web-comic-spaco-28-ks/'
  '毛虫を退治するゲームを作りたいけど絵がないんだぁ http://pronama.azurewebsites.net/2015/04/16/web-comic-spaco-31/'
  'この宇宙生物みたいな感じがボスキャラにふさわしいよね http://pronama.azurewebsites.net/2015/04/16/web-comic-spaco-31/'
  '鯉のぼりになれるアプリを開発したよ〜 http://pronama.azurewebsites.net/2015/05/05/web-comic-spaco-32/'
  'というわけで五月病の予防アプリ作ったよ http://pronama.azurewebsites.net/2015/05/05/web-comic-spaco-32/'
  'たけのこがおいしい季節だね http://pronama.azurewebsites.net/2015/05/26/web-comic-spaco-33/'
  'ね！ http://pronama.azurewebsites.net/2015/05/26/web-comic-spaco-33/'
  '今日からみんな夏服だね http://pronama.azurewebsites.net/2015/06/08/web-comic-spaco-34/'
  '梅雨入りしてから全然外に出てないねー http://pronama.azurewebsites.net/2015/06/08/web-comic-spaco-34/'
]

module.exports = (robot) ->
  new Cron '15 5 9,12,20,22,23 * * *', () =>
    index = Math.floor(Math.random() * word_list.length)
    robot.send {}, "#{word_list[index]} #pronama"
  , null, true, 'Asia/Tokyo'
