package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.net.URLRequest;
   
   public class NewsItem extends Sprite
   {
      private var newsText:LabelBase;
      
      private var dateLabel:LabelBase;
      
      public function NewsItem(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(0,0);
         _loc4_.graphics.drawRect(0,0,10,100);
         _loc4_.graphics.endFill();
         _loc4_.y = y;
         addChild(_loc4_);
         var _loc5_:Loader = new Loader();
         var _loc6_:URLRequest = new URLRequest(param1);
         _loc5_.load(_loc6_);
         addChild(_loc5_);
         _loc5_.x = 5;
         _loc5_.y = 20;
         this.newsText = new LabelBase();
         this.newsText.x = 90;
         this.newsText.y = 20;
         this.newsText.wordWrap = true;
         this.newsText.multiline = true;
         this.newsText.width = 350;
         this.newsText.htmlText = param2;
         this.newsText.color = 5898034;
         addChild(this.newsText);
         this.dateLabel = new LabelBase();
         this.dateLabel.x = 0;
         this.dateLabel.y = 0;
         this.dateLabel.text = param3;
         this.dateLabel.size = 10;
         this.dateLabel.color = 5898034;
         addChild(this.dateLabel);
      }
   }
}

