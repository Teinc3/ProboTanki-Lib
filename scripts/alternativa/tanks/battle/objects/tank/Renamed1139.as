package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class Renamed1136 implements Renamed968
   {
      private static const position:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const Renamed1137:Matrix3 = new Matrix3();
      
      public var tank:Tank;
      
      public function Renamed1136(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      public function reset() : void
      {
      }
      
      public function update(param1:Number) : void
      {
         this.tank.Renamed970.toMatrix3(Renamed1137);
         position.copy(this.tank.Renamed972);
         position.transform3(Renamed1137);
         position.add(this.tank.Renamed969);
         this.tank.Renamed970.getEulerAngles(eulerAngles);
         this.tank.Renamed1075().Renamed1138(position,eulerAngles);
      }
   }
}

