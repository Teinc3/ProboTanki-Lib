package alternativa.tanks.battle
{
   public class §break var override§
   {
      public var r:int;
      
      public var g:int;
      
      public var b:int;
      
      public function §break var override§(param1:int)
      {
         super();
         this.setColor(param1);
      }
      
      private static function clamp(param1:int) : int
      {
         return param1 < 0 ? int(0) : int(param1);
      }
      
      private static function §get set in§(param1:int) : int
      {
         return param1 & 0xFF;
      }
      
      public function setColor(param1:int) : void
      {
         this.r = §get set in§(param1 >> 16);
         this.g = §get set in§(param1 >> 8);
         this.b = §get set in§(param1);
      }
      
      public function §#!@§() : int
      {
         return this.r << 16 | this.g << 8 | this.b;
      }
      
      public function subtract(param1:§break var override§) : void
      {
         this.r = clamp(this.r - param1.r);
         this.g = clamp(this.g - param1.g);
         this.b = clamp(this.b - param1.b);
      }
   }
}

