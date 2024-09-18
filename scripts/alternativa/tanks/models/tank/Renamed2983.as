package alternativa.tanks.models.tank
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed752;
   import alternativa.tanks.battle.Renamed832;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed2789 extends Renamed832 implements Renamed752
   {
      private static const Renamed2947:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const Renamed2978:Number = Math.PI / 6;
      
      private var tank:Tank;
      
      private var Renamed2952:int;
      
      private var Renamed2979:Number;
      
      public function Renamed2789(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      public function reset() : void
      {
         this.Renamed2952 = Renamed619().Renamed653();
         this.Renamed2979 = this.tank.Renamed697();
      }
      
      public function Renamed753(param1:Number) : void
      {
         if(this.Renamed2965())
         {
            this.Renamed2980(false);
         }
         else if(this.Renamed2962())
         {
            this.Renamed2980(true);
         }
      }
      
      private function Renamed2965() : Boolean
      {
         return this.Renamed2981();
      }
      
      private function Renamed2962() : Boolean
      {
         return this.Renamed2982();
      }
      
      private function Renamed2982() : Boolean
      {
         var _loc1_:Number = Math.abs(MathUtils.clampAngle(this.tank.Renamed697() - this.Renamed2979));
         return _loc1_ > Renamed2978;
      }
      
      private function Renamed2981() : Boolean
      {
         return Renamed619().Renamed653() - this.Renamed2952 > Renamed2947.getInt();
      }
      
      private function Renamed2980(param1:Boolean) : void
      {
         this.reset();
         Renamed2407(OSGi.getInstance().getService(Renamed2408)).onTurretDirectionCorrection(param1);
      }
   }
}

