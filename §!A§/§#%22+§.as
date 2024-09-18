package §!A§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §#"+§
   {
      private var _sound:SoundResource;
      
      private var §continue final§:ImageResource;
      
      public function §#"+§(param1:SoundResource = null, param2:ImageResource = null)
      {
         super();
         this._sound = param1;
         this.§continue final§ = param2;
      }
      
      public function get sound() : SoundResource
      {
         return this._sound;
      }
      
      public function set sound(param1:SoundResource) : void
      {
         this._sound = param1;
      }
      
      public function get sprite() : ImageResource
      {
         return this.§continue final§;
      }
      
      public function set sprite(param1:ImageResource) : void
      {
         this.§continue final§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleGoldBonusCC [";
         _loc1_ += "sound = " + this.sound + " ";
         _loc1_ += "sprite = " + this.sprite + " ";
         return _loc1_ + "]";
      }
   }
}

