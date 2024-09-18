package Renamed361
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed5339
   {
      private var Renamed8173:SoundResource;
      
      private var Renamed8174:SoundResource;
      
      private var Renamed8175:SoundResource;
      
      private var Renamed8176:SoundResource;
      
      private var Renamed8177:SoundResource;
      
      public function Renamed5339(param1:SoundResource = null, param2:SoundResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:SoundResource = null)
      {
         super();
         this.Renamed8173 = param1;
         this.Renamed8174 = param2;
         this.Renamed8175 = param3;
         this.Renamed8176 = param4;
         this.Renamed8177 = param5;
      }
      
      public function get engineIdleSound() : SoundResource
      {
         return this.Renamed8173;
      }
      
      public function set engineIdleSound(param1:SoundResource) : void
      {
         this.Renamed8173 = param1;
      }
      
      public function get engineMovingSound() : SoundResource
      {
         return this.Renamed8174;
      }
      
      public function set engineMovingSound(param1:SoundResource) : void
      {
         this.Renamed8174 = param1;
      }
      
      public function get engineStartMovingSound() : SoundResource
      {
         return this.Renamed8175;
      }
      
      public function set engineStartMovingSound(param1:SoundResource) : void
      {
         this.Renamed8175 = param1;
      }
      
      public function get Renamed8178() : SoundResource
      {
         return this.Renamed8176;
      }
      
      public function set Renamed8178(param1:SoundResource) : void
      {
         this.Renamed8176 = param1;
      }
      
      public function get Renamed8179() : SoundResource
      {
         return this.Renamed8177;
      }
      
      public function set Renamed8179(param1:SoundResource) : void
      {
         this.Renamed8177 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "EngineCC [";
         _loc1_ += "engineIdleSound = " + this.engineIdleSound + " ";
         _loc1_ += "engineMovingSound = " + this.engineMovingSound + " ";
         _loc1_ += "engineStartMovingSound = " + this.engineStartMovingSound + " ";
         _loc1_ += "engineStartSound = " + this.Renamed8178 + " ";
         _loc1_ += "engineStopMovingSound = " + this.Renamed8179 + " ";
         return _loc1_ + "]";
      }
   }
}

