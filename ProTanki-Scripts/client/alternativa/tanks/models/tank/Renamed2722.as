package alternativa.tanks.models.tank
{
   import Renamed602.3DPositionVector;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.objects.tank.Tank;
   import flash.utils.getTimer;
   
   public class Renamed2722 implements Renamed768
   {
      private var tank:Tank;
      
      private var Renamed2723:Function;
      
      private var Renamed2724:uint;
      
      private var Renamed2725:3DPositionVector;
      
      private var Renamed2726:3DPositionVector;
      
      private var Renamed2727:int;
      
      private var Renamed2728:int;
      
      public function Renamed2722(param1:Tank, param2:Function, param3:int, param4:int)
      {
         super();
         this.Renamed2724 = 0;
         this.tank = param1;
         this.Renamed2723 = param2;
         this.Renamed2727 = param3;
         this.Renamed2728 = param4 * param4;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(Boolean(this.Renamed2729()) && (this.Renamed2730() || this.Renamed2731(param1)))
         {
            this.Renamed2724 = getTimer();
            this.Renamed2723(this.tank.Renamed695(),this.Renamed2725,this.Renamed2726);
         }
      }
      
      private function Renamed2729() : 3DPositionVector
      {
         return this.Renamed2725;
      }
      
      private function Renamed2731(param1:int) : Boolean
      {
         return param1 - this.Renamed2724 > this.Renamed2727;
      }
      
      private function Renamed2730() : Boolean
      {
         if(this.Renamed2725)
         {
            return Renamed2732.Renamed2733(this.tank.Renamed696().state.position,this.Renamed2725) > this.Renamed2728;
         }
         return false;
      }
      
      public function Renamed2734(param1:3DPositionVector, param2:3DPositionVector) : void
      {
         this.Renamed2724 = getTimer();
         this.Renamed2725 = param1;
         this.Renamed2726 = param2;
      }
   }
}

