package projects.tanks.client.panel.model.battleinvite
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed4321
   {
      private var Renamed4322:SoundResource;
      
      public function Renamed4321(param1:SoundResource = null)
      {
         super();
         this.Renamed4322 = param1;
      }
      
      public function get Renamed2087() : SoundResource
      {
         return this.Renamed4322;
      }
      
      public function set Renamed2087(param1:SoundResource) : void
      {
         this.Renamed4322 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BattleInviteCC [";
         _loc1_ += "soundNotification = " + this.Renamed2087 + " ";
         return _loc1_ + "]";
      }
   }
}

