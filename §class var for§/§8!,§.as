package §class var for§
{
   import alternativa.tanks.camera.§!"t§;
   import alternativa.tanks.camera.§include package const§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class §8!,§ implements §override set static§
   {
      private var §static class§:Object;
      
      private var §="J§:Dictionary;
      
      private var controller:§const set default§;
      
      public function §8!,§(param1:§const set default§)
      {
         this.§static class§ = new §include package const§(10);
         this.§="J§ = new Dictionary();
         super();
         this.controller = param1;
         this.§ $"§();
      }
      
      public function §-#8§(param1:KeyboardEvent) : void
      {
         var _loc2_:* = this.§="J§[param1.keyCode];
         if(_loc2_ != null)
         {
            if(param1.ctrlKey)
            {
               this.saveCurrentPositionCameraToBookmark(_loc2_);
            }
            else
            {
               this.§5#K§(_loc2_);
            }
         }
      }
      
      public function §dynamic package override§(param1:KeyboardEvent) : void
      {
      }
      
      private function § $"§() : void
      {
         this.§="J§[Keyboard.NUMBER_0] = 0;
         this.§="J§[Keyboard.NUMBER_1] = 1;
         this.§="J§[Keyboard.NUMBER_2] = 2;
         this.§="J§[Keyboard.NUMBER_3] = 3;
         this.§="J§[Keyboard.NUMBER_4] = 4;
         this.§="J§[Keyboard.NUMBER_5] = 5;
         this.§="J§[Keyboard.NUMBER_6] = 6;
         this.§="J§[Keyboard.NUMBER_7] = 7;
         this.§="J§[Keyboard.NUMBER_8] = 8;
         this.§="J§[Keyboard.NUMBER_9] = 9;
      }
      
      private function saveCurrentPositionCameraToBookmark(param1:int) : void
      {
         this.§static class§.saveCurrentPositionCameraToBookmark(param1);
      }
      
      private function §5#K§(param1:int) : void
      {
         var _loc2_:§!"t§ = this.§static class§.getBookmark(param1);
         if(_loc2_ != null)
         {
            this.controller.§-Y§(_loc2_.position,_loc2_.§finally for finally§);
         }
      }
   }
}

