package alternativa.tanks.view.battlelist.friends
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class FriendsIndicator extends Sprite
   {
      private static var friendsGreenClass:Class = FriendsIndicator_friendsGreenClass;
      
      private static var friendsGreenBitmapData:BitmapData = Bitmap(new friendsGreenClass()).bitmapData;
      
      private static var friendsGreenDarkClass:Class = FriendsIndicator_friendsGreenDarkClass;
      
      private static var friendsGreenDarkBitmapData:BitmapData = Bitmap(new friendsGreenDarkClass()).bitmapData;
      
      private static var friendsGreyClass:Class = FriendsIndicator_friendsGreyClass;
      
      private static var friendsGreyBitmapData:BitmapData = Bitmap(new friendsGreyClass()).bitmapData;
      
      private static var friendsGreyDarkClass:Class = FriendsIndicator_friendsGreyDarkClass;
      
      private static var friendsGreyDarkBitmapData:BitmapData = Bitmap(new friendsGreyDarkClass()).bitmapData;
      
      public function FriendsIndicator(param1:Boolean, param2:Boolean, param3:int, param4:uint)
      {
         super();
         this.init(param1,param2,param3,param4);
      }
      
      private function init(param1:Boolean, param2:Boolean, param3:int, param4:uint) : void
      {
         var _loc5_:Bitmap = null;
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,18,16);
         graphics.endFill();
         if(param2)
         {
            if(param1)
            {
               _loc5_ = new Bitmap(friendsGreenDarkBitmapData);
            }
            else
            {
               _loc5_ = new Bitmap(friendsGreenBitmapData);
            }
         }
         else if(param1)
         {
            _loc5_ = new Bitmap(friendsGreyDarkBitmapData);
         }
         else
         {
            _loc5_ = new Bitmap(friendsGreyBitmapData);
         }
         _loc5_.y = 3;
         addChild(_loc5_);
         var _loc6_:LabelBase;
         (_loc6_ = new LabelBase()).text = String(param3);
         _loc6_.x = _loc5_.width;
         _loc6_.y = -1;
         _loc6_.color = param4;
         addChild(_loc6_);
      }
   }
}

