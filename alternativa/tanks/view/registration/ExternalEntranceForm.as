package alternativa.tanks.view.registration
{
   import alternativa.tanks.service.IExternalEntranceService;
   import controls.FBButton;
   import controls.TankWindow;
   import controls.VKButton;
   import controls.base.LabelBase;
   import controls.containers.§2H§;
   import controls.§static set dynamic§;
   import flash.utils.Dictionary;
   
   public class ExternalEntranceForm extends TankWindow
   {
      [Inject]
      public static var §7#L§:IExternalEntranceService;
      
      public var §]!R§:VKButton;
      
      public var §9H§:FBButton;
      
      public var §function package else§:§static set dynamic§;
      
      private var infoLabel:LabelBase;
      
      private var §extends catch do§:§2H§;
      
      private var buttons:Dictionary;
      
      public function ExternalEntranceForm(param1:int, param2:int, param3:String)
      {
         var _loc4_:* = null;
         this.§]!R§ = new VKButton();
         this.§9H§ = new FBButton();
         this.§function package else§ = new §static set dynamic§();
         this.§extends catch do§ = new §2H§();
         this.buttons = new Dictionary();
         super(param1,param2);
         this.infoLabel = new LabelBase();
         this.infoLabel.text = param3;
         this.infoLabel.y = 15;
         this.infoLabel.x = param1 / 2 - this.infoLabel.width / 2;
         addChild(this.infoLabel);
         if(§7#L§.§%"I§)
         {
            this.buttons["vkontakte"] = this.§]!R§;
         }
         if(§7#L§.§package set default§)
         {
            this.buttons["facebook"] = this.§9H§;
         }
         if(§7#L§.§final get§)
         {
            this.buttons["google"] = this.§function package else§;
         }
         this.§extends catch do§.§!!t§(5);
         for(_loc4_ in this.buttons)
         {
            this.buttons[_loc4_].width = 102;
            this.§extends catch do§.addItem(this.buttons[_loc4_]);
         }
         this.§extends catch do§.y = 35;
         this.§extends catch do§.x = param1 / 2 - this.§extends catch do§.width / 2;
         addChild(this.§extends catch do§);
      }
   }
}

