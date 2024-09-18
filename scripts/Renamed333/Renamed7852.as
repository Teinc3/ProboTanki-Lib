package Renamed333
{
   import alternativa.tanks.camera.Renamed1453;
   import alternativa.tanks.camera.Renamed1493;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class Renamed7852 implements Renamed7849
   {
      private var Renamed1494:Object;
      
      private var Renamed7853:Dictionary;
      
      private var controller:Renamed2382;
      
      public function Renamed7852(param1:Renamed2382)
      {
         this.Renamed1494 = new Renamed1493(10);
         this.Renamed7853 = new Dictionary();
         super();
         this.controller = param1;
         this.Renamed7854();
      }
      
      public function Renamed2516(param1:KeyboardEvent) : void
      {
         var _loc2_:* = this.Renamed7853[param1.keyCode];
         if(_loc2_ != null)
         {
            if(param1.ctrlKey)
            {
               this.saveCurrentPositionCameraToBookmark(_loc2_);
            }
            else
            {
               this.Renamed7855(_loc2_);
            }
         }
      }
      
      public function Renamed7851(param1:KeyboardEvent) : void
      {
      }
      
      private function Renamed7854() : void
      {
         this.Renamed7853[Keyboard.NUMBER_0] = 0;
         this.Renamed7853[Keyboard.NUMBER_1] = 1;
         this.Renamed7853[Keyboard.NUMBER_2] = 2;
         this.Renamed7853[Keyboard.NUMBER_3] = 3;
         this.Renamed7853[Keyboard.NUMBER_4] = 4;
         this.Renamed7853[Keyboard.NUMBER_5] = 5;
         this.Renamed7853[Keyboard.NUMBER_6] = 6;
         this.Renamed7853[Keyboard.NUMBER_7] = 7;
         this.Renamed7853[Keyboard.NUMBER_8] = 8;
         this.Renamed7853[Keyboard.NUMBER_9] = 9;
      }
      
      private function saveCurrentPositionCameraToBookmark(param1:int) : void
      {
         this.Renamed1494.saveCurrentPositionCameraToBookmark(param1);
      }
      
      private function Renamed7855(param1:int) : void
      {
         var _loc2_:Renamed1453 = this.Renamed1494.getBookmark(param1);
         if(_loc2_ != null)
         {
            this.controller.Renamed7856(_loc2_.position,_loc2_.Renamed1454);
         }
      }
   }
}

