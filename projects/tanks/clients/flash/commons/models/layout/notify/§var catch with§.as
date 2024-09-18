package projects.tanks.clients.flash.commons.models.layout.notify
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class §var catch with§ implements ILobbyLayoutNotify
   {
      private var object:IGameObject;
      
      private var impl:Vector.<ILobbyLayoutNotify>;
      
      public function §var catch with§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<ILobbyLayoutNotify>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function layoutSwitchPredicted() : void
      {
         var i:int = 0;
         var m:ILobbyLayoutNotify = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.layoutSwitchPredicted();
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function isSwitchInProgress() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:ILobbyLayoutNotify = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.isSwitchInProgress();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getCurrentState() : LayoutState
      {
         var result:LayoutState = null;
         var i:int = 0;
         var m:ILobbyLayoutNotify = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCurrentState();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function inBattle() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:ILobbyLayoutNotify = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.inBattle();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

