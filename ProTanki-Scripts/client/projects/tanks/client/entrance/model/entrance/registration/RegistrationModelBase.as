package projects.tanks.client.entrance.model.entrance.registration
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class RegistrationModelBase extends Model
   {
      private var _protocol:IProtocol;
      
      protected var server:RegistrationModelServer;
      
      private var client:IRegistrationModelBase;
      
      private var modelId:Long;
      
      private var _anchorRegistrationId:Long;
      
      private var _enteredUidIsBusyId:Long;
      
      private var _enteredUidIsFreeId:Long;
      
      private var _enteredUidIsIncorrectId:Long;
      
      private var _passwordIsIncorrectId:Long;
      
      private var _registrationFailedId:Long;
      
      public function RegistrationModelBase()
      {
         this._protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.client = IRegistrationModelBase(this);
         this.modelId = Long.getLong(0,300020025);
         this._anchorRegistrationId = Long.getLong(0,300020069);
         this._enteredUidIsBusyId = Long.getLong(0,300020070);
         this._enteredUidIsFreeId = Long.getLong(0,300020071);
         this._enteredUidIsIncorrectId = Long.getLong(0,300020072);
         this._passwordIsIncorrectId = Long.getLong(0,300020073);
         this._registrationFailedId = Long.getLong(0,300020074);
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new RegistrationModelServer(IModel(this));
         var _loc1_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : RegistrationModelCC
      {
         return RegistrationModelCC(initParams[Model.object]);
      }
      
      override public function invoke(param1:Long, param2:ProtocolBuffer) : void
      {
         switch(param1)
         {
            case this._anchorRegistrationId:
               this.client.anchorRegistration();
               break;
            case this._enteredUidIsBusyId:
               break;
            case this._enteredUidIsFreeId:
               this.client.enteredUidIsFree();
               break;
            case this._enteredUidIsIncorrectId:
               this.client.enteredUidIsIncorrect();
               break;
            case this._passwordIsIncorrectId:
               this.client.passwordIsIncorrect();
               break;
            case this._registrationFailedId:
               this.client.registrationFailed();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

