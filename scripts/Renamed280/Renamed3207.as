package Renamed280
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Renamed3207
   {
      private var tank:Tank;
      
      private var Renamed7196:Vector3;
      
      private var Renamed7197:Vector3;
      
      public function Renamed3207()
      {
         this.Renamed7196 = new Vector3();
         this.Renamed7197 = new Vector3();
         super();
      }
      
      public function Renamed3361(param1:Vector3, param2:Tank = null) : void
      {
         this.Renamed7196.copy(param1);
         this.tank = param2;
         if(this.Renamed7191())
         {
            this.Renamed7197.copy(param1);
            Renamed668.globalToLocal(param2.Renamed696(),this.Renamed7197);
         }
      }
      
      public function Renamed7191() : Boolean
      {
         return this.tank != null && this.tank.Renamed1075().Renamed1023() != null;
      }
      
      public function getTank() : Tank
      {
         return this.tank;
      }
      
      public function Renamed7189() : Vector3
      {
         return this.Renamed7196;
      }
      
      public function Renamed7193() : Vector3
      {
         return this.Renamed7197;
      }
      
      public function reset() : void
      {
         this.tank = null;
         this.Renamed7196.reset();
         this.Renamed7197.reset();
      }
   }
}

