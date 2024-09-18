package §8%§
{
   import alternativa.math.Vector3;
   import mx.utils.StringUtil;
   
   public class §break catch final§
   {
      private var direction:Vector3;
      
      private var angle:Number;
      
      private var §switch for null§:Number;
      
      private var §use set true§:Number;
      
      public function §break catch final§(param1:Vector3, param2:Number, param3:Number, param4:Number = 0)
      {
         super();
         this.direction = param1.clone();
         this.angle = param2;
         this.§switch for null§ = param3;
         this.§use set true§ = param4;
      }
      
      public static function comparator(param1:§break catch final§, param2:§break catch final§) : Number
      {
         return param2.§switch for null§ - param1.§switch for null§;
      }
      
      public function §do var§() : Vector3
      {
         return this.direction;
      }
      
      public function §else var else§() : Number
      {
         return this.angle;
      }
      
      public function §,!A§() : Number
      {
         return this.§switch for null§;
      }
      
      public function §'!I§() : Number
      {
         return this.§use set true§;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("TargetingDirection[direction={0}, angle={1}, maxPriority={2}]",this.direction,this.angle.toFixed(2),this.§switch for null§.toFixed(0));
      }
   }
}

