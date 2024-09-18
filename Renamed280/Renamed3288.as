package Renamed280
{
   import alternativa.tanks.models.weapon.shaft.Renamed3208;
   import alternativa.tanks.models.weapon.shaft.Renamed3212;
   
   public class Renamed3288 implements Renamed3230
   {
      private var weapon:Renamed3208;
      
      private var Renamed7155:int;
      
      private var Renamed6923:int;
      
      public function Renamed3288(param1:Renamed3208, param2:int)
      {
         super();
         this.weapon = param1;
         this.Renamed7155 = param2;
      }
      
      public function enter(param1:int) : void
      {
         this.Renamed6923 = param1 + this.Renamed7155;
      }
      
      public function update(param1:int, param2:int) : void
      {
         if(this.weapon.Renamed3218())
         {
            this.weapon.Renamed3211(Renamed3212.STOP);
         }
         else if(param1 >= this.Renamed6923 && this.weapon.Renamed2961(param1) == this.weapon.Renamed3220())
         {
            this.weapon.Renamed3211(Renamed3212.SWITCH);
         }
      }
      
      public function exit() : void
      {
      }
      
      public function Renamed3211(param1:Renamed3212, param2:*) : void
      {
         switch(param1)
         {
            case Renamed3212.TRIGGER_RELEASE:
               this.weapon.Renamed3211(Renamed3212.TRIGGER_RELEASE);
         }
      }
   }
}

