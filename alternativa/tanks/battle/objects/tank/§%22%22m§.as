package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class §""m§ implements §default catch import§
   {
      private static const position:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const §default for true§:Matrix3 = new Matrix3();
      
      public var tank:Tank;
      
      public function §""m§(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      public function reset() : void
      {
      }
      
      public function update(param1:Number) : void
      {
         this.tank.§^#§.toMatrix3(§default for true§);
         position.copy(this.tank.§catch package false§);
         position.transform3(§default for true§);
         position.add(this.tank.§include for var§);
         this.tank.§^#§.getEulerAngles(eulerAngles);
         this.tank.§in package default§().§function set catch§(position,eulerAngles);
      }
   }
}

