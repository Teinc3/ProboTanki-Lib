package Renamed50
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Renamed925;
   import alternativa.tanks.battle.objects.tank.Renamed990;
   import alternativa.tanks.battle.objects.tank.Tank;
   import Renamed82.Renamed8544;
   
   public class Renamed9820 implements Renamed990, Renamed9766
   {
      private var effects:Renamed9752;
      
      private var currentTarget:Tank;
      
      public function Renamed9820(param1:Renamed9752)
      {
         super();
         this.effects = param1;
      }
      
      public function init(param1:Renamed925) : void
      {
         this.effects.init(param1.Renamed1020(),param1.Renamed1071());
      }
      
      public function destroy() : void
      {
         this.reset();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.reset();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(param1:Boolean) : void
      {
         this.reset();
      }
      
      public function reset() : void
      {
         this.currentTarget = null;
         this.effects.Renamed3062();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function Renamed9825(param1:Renamed8544, param2:Tank = null, param3:Vector3 = null) : void
      {
         this.effects.Renamed9835(param1,param2,param3);
         this.currentTarget = param2;
      }
      
      public function Renamed7205() : void
      {
         this.effects.Renamed9835(Renamed8544.IDLE);
         this.currentTarget = null;
      }
      
      public function stop() : void
      {
         this.effects.Renamed3062();
         this.currentTarget = null;
      }
      
      public function Renamed9767(param1:Tank) : void
      {
         if(param1 != null)
         {
            if(this.currentTarget == param1)
            {
               this.currentTarget = null;
               this.effects.Renamed9835(Renamed8544.IDLE);
            }
         }
      }
   }
}

