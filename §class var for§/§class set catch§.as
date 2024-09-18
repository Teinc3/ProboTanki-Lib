package §class var for§
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class §class set catch§ implements §&",§, §override set static§
   {
      public static const §function catch finally§:int = 0;
      
      public static const §while for for§:int = 1;
      
      public static const §!#`§:int = 2;
      
      public static const §""?§:int = 3;
      
      public static const §return package include§:int = 4;
      
      public static const §,"R§:int = 5;
      
      public static const §do set§:int = 6;
      
      public static const §8#U§:int = 7;
      
      public static const §import set try§:int = 8;
      
      public static const §1",§:int = 9;
      
      public static const §if const§:int = 10;
      
      private static const §break var get§:int = 1 << §if const§ | 1 << §1",§ | 1 << §8#U§ | 1 << §import set try§;
      
      private var §="l§:Dictionary;
      
      private var §native const§:BitMask;
      
      public function §class set catch§()
      {
         this.§="l§ = new Dictionary();
         this.§native const§ = new BitMask(0);
         super();
         this.§="l§[Keyboard.W] = §function catch finally§;
         this.§="l§[Keyboard.S] = §while for for§;
         this.§="l§[Keyboard.A] = §!#`§;
         this.§="l§[Keyboard.D] = §""?§;
         this.§="l§[Keyboard.Q] = §,"R§;
         this.§="l§[Keyboard.E] = §return package include§;
         this.§="l§[Keyboard.SHIFT] = §do set§;
         this.§="l§[Keyboard.LEFT] = §8#U§;
         this.§="l§[Keyboard.RIGHT] = §import set try§;
         this.§="l§[Keyboard.UP] = §1",§;
         this.§="l§[Keyboard.DOWN] = §if const§;
      }
      
      public function §7,§() : int
      {
         return this.§do var§(§function catch finally§,§while for for§);
      }
      
      public function §return for true§() : int
      {
         return this.§do var§(§""?§,§!#`§);
      }
      
      public function §use package while§() : int
      {
         return this.§do var§(§return package include§,§,"R§);
      }
      
      public function §var set with§() : Boolean
      {
         return this.§native const§.getBitValue(§do set§) == 1;
      }
      
      public function §-#8§(param1:KeyboardEvent) : void
      {
         if(this.§="l§[param1.keyCode] != null)
         {
            this.§native const§.setBit(this.§="l§[param1.keyCode]);
         }
      }
      
      public function §dynamic package override§(param1:KeyboardEvent) : void
      {
         if(this.§="l§[param1.keyCode] != null)
         {
            this.§native const§.clearBit(this.§="l§[param1.keyCode]);
         }
      }
      
      public function §<!2§() : int
      {
         return this.§do var§(§8#U§,§import set try§);
      }
      
      public function §super var false§() : int
      {
         return this.§do var§(§1",§,§if const§);
      }
      
      public function isRotating() : Boolean
      {
         return this.§native const§.hasAnyBit(§break var get§);
      }
      
      private function §do var§(param1:int, param2:int) : int
      {
         return this.§native const§.getBitValue(param1) - this.§native const§.getBitValue(param2);
      }
      
      public function reset() : void
      {
         this.§native const§.clear();
      }
   }
}

