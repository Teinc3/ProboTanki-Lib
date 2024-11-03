package Renamed387
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import Renamed376.Renamed4821;
   import Renamed385.Renamed4886;
   
   public class Renamed8384 extends Renamed4886
   {
      private var Renamed8385:PanelModel;
      
      private var Renamed7658:UserPropertiesModel;
      
      private var Renamed7236:Renamed4821;
      
      private var Renamed7576:SettingsModel;
      
      private var panelView:IPanelView;
      
      public var modelId:int;
      
      public function Renamed8384()
      {
         super();
         this.modelId = 10;
         this.Renamed8385 = PanelModel(modelRegistry.getModel(Long.getLong(0,300050032)));
         this.Renamed7658 = UserPropertiesModel(modelRegistry.getModel(Long.getLong(0,300050083)));
         this.Renamed7236 = Renamed4821(modelRegistry.getModel(Long.getLong(1726782619,1524609945)));
         this.Renamed7576 = SettingsModel(modelRegistry.getModel(Long.getLong(1428989873,1951780812)));
         this.panelView = IPanelView(OSGi.getInstance().getService(IPanelView));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case Renamed8380.Renamed8381:
               this.Renamed8386(param1);
               break;
            case Renamed8380.Renamed8382:
               this.Renamed8387(param1);
         }
      }
      
      private function Renamed8386(param1:Object) : void
      {
         this.Renamed7658.putInitParams(param1.userPropertyCC);
         this.Renamed8385.objectLoaded();
         this.Renamed7658.objectLoaded();
         this.Renamed7658.objectLoadedPost();
         this.Renamed8385.objectLoadedPost();
         this.Renamed7236.objectLoadedPost();
         this.Renamed7576.objectLoadedPost();
      }
      
      private function Renamed8387(param1:Object) : void
      {
         this.panelView.Renamed2160().hasDoubleCrystal = param1.enabled;
      }
   }
}

