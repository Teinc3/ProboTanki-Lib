package projects.tanks.client.panel.model.battleinvite
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class ProtectionContexts1
   {
      private var ProtectionContexts2:SoundResource;
      
      public function ProtectionContexts1(param1:SoundResource = null)
      {
         super();
         this.ProtectionContexts2 = param1;
      }
      
      public function get Renamed2087() : SoundResource
      {
         return this.ProtectionContexts2;
      }
      
      public function set Renamed2087(param1:SoundResource) : void
      {
         this.ProtectionContexts2 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInviteCC [";
         _loc1_ += "soundNotification = " + this.Renamed2087 + " ";
         return _loc1_ + "]";
      }
   }
}

