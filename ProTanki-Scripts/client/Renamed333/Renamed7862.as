package Renamed333
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class Renamed7862 implements Renamed7839, Renamed7849
   {
      public static const Renamed7863:int = 0;
      
      public static const Renamed7864:int = 1;
      
      public static const Renamed7865:int = 2;
      
      public static const Renamed7866:int = 3;
      
      public static const Renamed7186:int = 4;
      
      public static const Renamed7187:int = 5;
      
      public static const Renamed7867:int = 6;
      
      public static const Renamed7868:int = 7;
      
      public static const Renamed7869:int = 8;
      
      public static const Renamed7870:int = 9;
      
      public static const Renamed7871:int = 10;
      
      private static const Renamed7872:int = 1 << Renamed7871 | 1 << Renamed7870 | 1 << Renamed7868 | 1 << Renamed7869;
      
      private var Renamed3873:Dictionary;
      
      private var Renamed2794:BitMask;
      
      public function Renamed7862()
      {
         this.Renamed3873 = new Dictionary();
         this.Renamed2794 = new BitMask(0);
         super();
         this.Renamed3873[Keyboard.W] = Renamed7863;
         this.Renamed3873[Keyboard.S] = Renamed7864;
         this.Renamed3873[Keyboard.A] = Renamed7865;
         this.Renamed3873[Keyboard.D] = Renamed7866;
         this.Renamed3873[Keyboard.Q] = Renamed7187;
         this.Renamed3873[Keyboard.E] = Renamed7186;
         this.Renamed3873[Keyboard.SHIFT] = Renamed7867;
         this.Renamed3873[Keyboard.LEFT] = Renamed7868;
         this.Renamed3873[Keyboard.RIGHT] = Renamed7869;
         this.Renamed3873[Keyboard.UP] = Renamed7870;
         this.Renamed3873[Keyboard.DOWN] = Renamed7871;
      }
      
      public function Renamed7840() : int
      {
         return this.Renamed1013(Renamed7863,Renamed7864);
      }
      
      public function Renamed7841() : int
      {
         return this.Renamed1013(Renamed7866,Renamed7865);
      }
      
      public function Renamed7842() : int
      {
         return this.Renamed1013(Renamed7186,Renamed7187);
      }
      
      public function Renamed7843() : Boolean
      {
         return this.Renamed2794.getBitValue(Renamed7867) == 1;
      }
      
      public function Renamed2516(param1:KeyboardEvent) : void
      {
         if(this.Renamed3873[param1.keyCode] != null)
         {
            this.Renamed2794.setBit(this.Renamed3873[param1.keyCode]);
         }
      }
      
      public function Renamed7851(param1:KeyboardEvent) : void
      {
         if(this.Renamed3873[param1.keyCode] != null)
         {
            this.Renamed2794.clearBit(this.Renamed3873[param1.keyCode]);
         }
      }
      
      public function Renamed7845() : int
      {
         return this.Renamed1013(Renamed7868,Renamed7869);
      }
      
      public function Renamed7846() : int
      {
         return this.Renamed1013(Renamed7870,Renamed7871);
      }
      
      public function isRotating() : Boolean
      {
         return this.Renamed2794.hasAnyBit(Renamed7872);
      }
      
      private function Renamed1013(param1:int, param2:int) : int
      {
         return this.Renamed2794.getBitValue(param1) - this.Renamed2794.getBitValue(param2);
      }
      
      public function reset() : void
      {
         this.Renamed2794.clear();
      }
   }
}

