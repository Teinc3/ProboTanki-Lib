package projects.tanks.client.tanksservices.model.notifier.online
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   
   public class OnlineNotifierData extends AbstractNotifier
   {
      private var _online:Boolean;
      
      private var _serverNumber:int;
      
      public function OnlineNotifierData(param1:Boolean = false, param2:int = 0)
      {
         super();
         this._online = param1;
         this._serverNumber = param2;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function set online(param1:Boolean) : void
      {
         this._online = param1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(param1:int) : void
      {
         this._serverNumber = param1;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "OnlineNotifierData [";
         _loc1_ += "online = " + this.online + " ";
         _loc1_ += "serverNumber = " + this.serverNumber + " ";
         _loc1_ += super.toString();
         return _loc1_ + "]";
      }
   }
}

