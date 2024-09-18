package §class for§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   
   public class §do for override§
   {
      public static const §var var each§:Number = -100;
      
      public var §]!k§:Number = -100;
      
      public var targets:Vector.<Body>;
      
      public var §class package const§:Vector.<Vector3>;
      
      public var staticHitPoint:Vector3;
      
      public var §!"!§:Vector3;
      
      public var hasStaticHit:Boolean;
      
      public var §finally package continue§:int;
      
      public function §do for override§()
      {
         this.targets = new Vector.<Body>();
         this.§class package const§ = new Vector.<Vector3>();
         this.staticHitPoint = new Vector3();
         this.§!"!§ = new Vector3();
         super();
      }
      
      public function clear() : void
      {
         this.targets.length = 0;
         this.§class package const§.length = 0;
         this.§]!k§ = §var var each§;
         this.hasStaticHit = false;
         this.§finally package continue§ = 0;
      }
      
      public function §=X§(param1:Vector3, param2:Vector3) : void
      {
         this.staticHitPoint.copy(param1);
         this.§!"!§.copy(param2);
         this.hasStaticHit = true;
      }
      
      public function §include package default§(param1:Body, param2:Vector3) : void
      {
         this.targets.push(param1);
         this.§class package const§.push(param2);
      }
      
      public function §set false§(param1:Body, param2:Vector3) : void
      {
         this.§include package default§(param1,param2);
         ++this.§finally package continue§;
      }
      
      public function §"0§() : Boolean
      {
         return this.targets.length > this.§finally package continue§;
      }
   }
}

