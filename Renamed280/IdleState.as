package Renamed280
{
   import alternativa.tanks.models.weapon.shaft.Renamed3140;
   import alternativa.tanks.models.weapon.shaft.Renamed3208;
   import alternativa.tanks.models.weapon.shaft.Renamed3212;
   
   public class IdleState implements Renamed3230
   {
      private var weapon:Renamed3208;
      
      private var Renamed3399:Boolean;
      
      public function IdleState(param1:Renamed3208)
      {
         super();
         this.weapon = param1;
      }
      
      public function enter(param1:int) : void
      {
         this.Renamed3399 = this.weapon.Renamed3209();
         this.weapon.Renamed3210(Renamed3140.RECHARGE);
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.Renamed3399)
         {
            this.Renamed7152();
         }
      }
      
      public function exit() : void
      {
      }
      
      public function Renamed3211(param1:Renamed3212, param2:*) : void
      {
         switch(param1)
         {
            case Renamed3212.TRIGGER_PULL:
               this.Renamed7153();
               break;
            case Renamed3212.TRIGGER_RELEASE:
               this.Renamed7154();
         }
      }
      
      private function Renamed7153() : void
      {
         if(!this.Renamed3399)
         {
            this.Renamed3399 = true;
            this.Renamed7152();
         }
      }
      
      private function Renamed7154() : void
      {
         this.Renamed3399 = false;
      }
      
      private function Renamed7152() : void
      {
         if(this.weapon.Renamed3225())
         {
            this.weapon.Renamed3211(Renamed3212.READY_TO_SHOOT);
            this.Renamed3399 = false;
         }
      }
   }
}

