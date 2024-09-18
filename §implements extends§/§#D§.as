package §implements extends§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.panel.PanelModel;
   import alternativa.tanks.model.settings.SettingsModel;
   import alternativa.tanks.model.userproperties.UserPropertiesModel;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import §function set dynamic§.§switch import§;
   import §if try§.§return package if§;
   
   public class §#D§ extends §return package if§
   {
      private var §dynamic var catch§:PanelModel;
      
      private var §?#X§:UserPropertiesModel;
      
      private var §const var function§:§switch import§;
      
      private var §"t§:SettingsModel;
      
      private var panelView:IPanelView;
      
      public var modelId:int;
      
      public function §#D§()
      {
         super();
         this.modelId = 10;
         this.§dynamic var catch§ = PanelModel(modelRegistry.getModel(Long.getLong(0,300050032)));
         this.§?#X§ = UserPropertiesModel(modelRegistry.getModel(Long.getLong(0,300050083)));
         this.§const var function§ = §switch import§(modelRegistry.getModel(Long.getLong(1726782619,1524609945)));
         this.§"t§ = SettingsModel(modelRegistry.getModel(Long.getLong(1428989873,1951780812)));
         this.panelView = IPanelView(OSGi.getInstance().getService(IPanelView));
      }
      
      public function invoke(param1:Object) : void
      {
         switch(param1.getPacketId())
         {
            case §!"V§.§super for use§:
               this.§default const super§(param1);
               break;
            case §!"V§.§4C§:
               this.§'_§(param1);
         }
      }
      
      private function §default const super§(param1:Object) : void
      {
         this.§?#X§.putInitParams(param1.userPropertyCC);
         this.§dynamic var catch§.objectLoaded();
         this.§?#X§.objectLoaded();
         this.§?#X§.objectLoadedPost();
         this.§dynamic var catch§.objectLoadedPost();
         this.§const var function§.objectLoadedPost();
         this.§"t§.objectLoadedPost();
      }
      
      private function §'_§(param1:Object) : void
      {
         this.panelView.§+#,§().hasDoubleCrystal = param1.enabled;
      }
   }
}

