package alternativa.tanks.models.tank
{
   import §;"?§.§#">§;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import flash.utils.getTimer;
   
   public class §,!3§ implements §;!t§
   {
      private var tank:Tank;
      
      private var §4">§:Function;
      
      private var §5-§:uint;
      
      private var §const const super§:§#">§;
      
      private var §while package static§:§#">§;
      
      private var §for package import§:int;
      
      private var §2!h§:int;
      
      public function §,!3§(param1:Tank, param2:Function, param3:int, param4:int)
      {
         super();
         this.§5-§ = 0;
         this.tank = param1;
         this.§4">§ = param2;
         this.§for package import§ = param3;
         this.§2!h§ = param4 * param4;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(Boolean(this.§function var const§()) && (this.§<[§() || this.§else package const§(param1)))
         {
            this.§5-§ = getTimer();
            this.§4">§(this.tank.§if for with§(),this.§const const super§,this.§while package static§);
         }
      }
      
      private function §function var const§() : §#">§
      {
         return this.§const const super§;
      }
      
      private function §else package const§(param1:int) : Boolean
      {
         return param1 - this.§5-§ > this.§for package import§;
      }
      
      private function §<[§() : Boolean
      {
         if(this.§const const super§)
         {
            return §do set include§.§ >§(this.tank.§0"t§().state.position,this.§const const super§) > this.§2!h§;
         }
         return false;
      }
      
      public function §while for else§(param1:§#">§, param2:§#">§) : void
      {
         this.§5-§ = getTimer();
         this.§const const super§ = param1;
         this.§while package static§ = param2;
      }
   }
}

