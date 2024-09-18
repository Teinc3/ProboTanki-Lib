package Renamed326
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed7688
   {
      private var Renamed7761:SoundResource;
      
      private var Renamed7762:int;
      
      private var Renamed7763:Vector.<Renamed7757>;
      
      private var Renamed7764:ImageResource;
      
      private var Renamed7765:SoundResource;
      
      private var Renamed7766:ImageResource;
      
      private var Renamed5516:ImageResource;
      
      private var Renamed5518:SoundResource;
      
      private var Renamed7767:Number;
      
      private var Renamed7768:ImageResource;
      
      private var Renamed7769:MultiframeImageResource;
      
      private var Renamed7770:Number;
      
      private var Renamed7771:MultiframeImageResource;
      
      private var Renamed7772:Number;
      
      private var Renamed7773:Tanks3DSResource;
      
      private var Renamed7774:Number;
      
      private var _radius:Number;
      
      private var Renamed7775:ImageResource;
      
      public function Renamed7688(param1:SoundResource = null, param2:int = 0, param3:Vector.<Renamed7757> = null, param4:ImageResource = null, param5:SoundResource = null, param6:ImageResource = null, param7:ImageResource = null, param8:SoundResource = null, param9:Number = 0, param10:ImageResource = null, param11:MultiframeImageResource = null, param12:Number = 0, param13:MultiframeImageResource = null, param14:Number = 0, param15:Tanks3DSResource = null, param16:Number = 0, param17:Number = 0, param18:ImageResource = null)
      {
         super();
         this.Renamed7761 = param1;
         this.Renamed7762 = param2;
         this.Renamed7763 = param3;
         this.Renamed7764 = param4;
         this.Renamed7765 = param5;
         this.Renamed7766 = param6;
         this.Renamed5516 = param7;
         this.Renamed5518 = param8;
         this.Renamed7767 = param9;
         this.Renamed7768 = param10;
         this.Renamed7769 = param11;
         this.Renamed7770 = param12;
         this.Renamed7771 = param13;
         this.Renamed7772 = param14;
         this.Renamed7773 = param15;
         this.Renamed7774 = param16;
         this._radius = param17;
         this.Renamed7775 = param18;
      }
      
      public function get Renamed7776() : SoundResource
      {
         return this.Renamed7761;
      }
      
      public function set Renamed7776(param1:SoundResource) : void
      {
         this.Renamed7761 = param1;
      }
      
      public function get Renamed7777() : int
      {
         return this.Renamed7762;
      }
      
      public function set Renamed7777(param1:int) : void
      {
         this.Renamed7762 = param1;
      }
      
      public function get Renamed7778() : Vector.<Renamed7757>
      {
         return this.Renamed7763;
      }
      
      public function set Renamed7778(param1:Vector.<Renamed7757>) : void
      {
         this.Renamed7763 = param1;
      }
      
      public function get Renamed7779() : ImageResource
      {
         return this.Renamed7764;
      }
      
      public function set Renamed7779(param1:ImageResource) : void
      {
         this.Renamed7764 = param1;
      }
      
      public function get Renamed7780() : SoundResource
      {
         return this.Renamed7765;
      }
      
      public function set Renamed7780(param1:SoundResource) : void
      {
         this.Renamed7765 = param1;
      }
      
      public function get Renamed7781() : ImageResource
      {
         return this.Renamed7766;
      }
      
      public function set Renamed7781(param1:ImageResource) : void
      {
         this.Renamed7766 = param1;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.Renamed5516;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.Renamed5516 = param1;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.Renamed5518;
      }
      
      public function set explosionSound(param1:SoundResource) : void
      {
         this.Renamed5518 = param1;
      }
      
      public function get Renamed7782() : Number
      {
         return this.Renamed7767;
      }
      
      public function set Renamed7782(param1:Number) : void
      {
         this.Renamed7767 = param1;
      }
      
      public function get Renamed7783() : ImageResource
      {
         return this.Renamed7768;
      }
      
      public function set Renamed7783(param1:ImageResource) : void
      {
         this.Renamed7768 = param1;
      }
      
      public function get Renamed7784() : MultiframeImageResource
      {
         return this.Renamed7769;
      }
      
      public function set Renamed7784(param1:MultiframeImageResource) : void
      {
         this.Renamed7769 = param1;
      }
      
      public function get impactForce() : Number
      {
         return this.Renamed7770;
      }
      
      public function set impactForce(param1:Number) : void
      {
         this.Renamed7770 = param1;
      }
      
      public function get Renamed7785() : MultiframeImageResource
      {
         return this.Renamed7771;
      }
      
      public function set Renamed7785(param1:MultiframeImageResource) : void
      {
         this.Renamed7771 = param1;
      }
      
      public function get Renamed7786() : Number
      {
         return this.Renamed7772;
      }
      
      public function set Renamed7786(param1:Number) : void
      {
         this.Renamed7772 = param1;
      }
      
      public function get Renamed7787() : Tanks3DSResource
      {
         return this.Renamed7773;
      }
      
      public function set Renamed7787(param1:Tanks3DSResource) : void
      {
         this.Renamed7773 = param1;
      }
      
      public function get Renamed7788() : Number
      {
         return this.Renamed7774;
      }
      
      public function set Renamed7788(param1:Number) : void
      {
         this.Renamed7774 = param1;
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set radius(param1:Number) : void
      {
         this._radius = param1;
      }
      
      public function get Renamed7789() : ImageResource
      {
         return this.Renamed7775;
      }
      
      public function set Renamed7789(param1:ImageResource) : void
      {
         this.Renamed7775 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleMineCC [";
         _loc1_ += "activateSound = " + this.Renamed7776 + " ";
         _loc1_ += "activateTimeMsec = " + this.Renamed7777 + " ";
         _loc1_ += "battleMines = " + this.Renamed7778 + " ";
         _loc1_ += "blueMineTexture = " + this.Renamed7779 + " ";
         _loc1_ += "deactivateSound = " + this.Renamed7780 + " ";
         _loc1_ += "enemyMineTexture = " + this.Renamed7781 + " ";
         _loc1_ += "explosionMarkTexture = " + this.explosionMarkTexture + " ";
         _loc1_ += "explosionSound = " + this.explosionSound + " ";
         _loc1_ += "farVisibilityRadius = " + this.Renamed7782 + " ";
         _loc1_ += "friendlyMineTexture = " + this.Renamed7783 + " ";
         _loc1_ += "idleExplosionTexture = " + this.Renamed7784 + " ";
         _loc1_ += "impactForce = " + this.impactForce + " ";
         _loc1_ += "mainExplosionTexture = " + this.Renamed7785 + " ";
         _loc1_ += "minDistanceFromBase = " + this.Renamed7786 + " ";
         _loc1_ += "model3ds = " + this.Renamed7787 + " ";
         _loc1_ += "nearVisibilityRadius = " + this.Renamed7788 + " ";
         _loc1_ += "radius = " + this.radius + " ";
         _loc1_ += "redMineTexture = " + this.Renamed7789 + " ";
         return _loc1_ + "]";
      }
   }
}

