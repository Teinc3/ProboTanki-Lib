package Renamed479
{
   import Renamed4543.Renamed4546;
   import Renamed4543.Renamed4547;
   import alternativa.math.Vector3;
   import alternativa.tanks.models.weapon.shaft.Renamed3184;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   
   public class Renamed3148 extends Renamed914
   {
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      private var Renamed9428:Boolean = false;
      
      private var Renamed9429:Renamed4546;
      
      private var Renamed9430:Renamed4633;
      
      private var Renamed5284:Vector3;
      
      private var Renamed3327:Renamed3184;
      
      private var Renamed9431:Renamed4547;
      
      private var Renamed9432:Renamed5281;
      
      public function Renamed3148(param1:Renamed915, param2:Renamed3184, param3:Number)
      {
         this.Renamed5284 = new Vector3();
         super(param1);
         this.Renamed9429 = new Renamed4546(param1,param3);
         this.Renamed9431 = new Renamed4547(param1);
         this.Renamed9430 = new Renamed4633(param2);
         this.Renamed3327 = param2;
      }
      
      public function Renamed7172() : void
      {
         var _loc1_:int = 0;
         if(!this.Renamed9428)
         {
            this.Renamed9428 = true;
            _loc1_ = Renamed926.Renamed1024();
            Renamed926.Renamed3408();
            switch(_loc1_)
            {
               case Renamed912.Renamed1026:
                  changeState(this.Renamed9429);
                  this.Renamed9432 = this.Renamed9429;
                  break;
               case Renamed912.Renamed1025:
                  changeState(this.Renamed9431);
                  this.Renamed9432 = this.Renamed9431;
            }
         }
      }
      
      public function Renamed7173() : void
      {
         if(this.Renamed9428)
         {
            this.Renamed9428 = false;
            Renamed926.Renamed3409();
            changeState(Renamed9433(Renamed926.Renamed1024()));
         }
      }
      
      public function Renamed3337() : void
      {
         Renamed9434();
      }
      
      override public function tick(param1:Number) : void
      {
         super.tick(param1);
         if(this.Renamed9428)
         {
            this.Renamed9432.Renamed3352(this.Renamed5284);
            this.Renamed9430.update(this.Renamed5284);
         }
      }
      
      public function Renamed5288(param1:Number) : void
      {
         this.Renamed9429.Renamed5288(param1);
      }
      
      public function Renamed3352(param1:Vector3) : void
      {
         this.Renamed9432.Renamed3352(param1);
      }
      
      public function Renamed3330() : Renamed3184
      {
         return this.Renamed3327;
      }
   }
}

