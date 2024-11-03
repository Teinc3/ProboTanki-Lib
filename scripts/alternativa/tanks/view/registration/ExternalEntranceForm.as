package alternativa.tanks.view.registration
{
   import alternativa.tanks.service.IExternalEntranceService;
   import controls.FBButton;
   import controls.TankWindow;
   import controls.VKButton;
   import controls.base.LabelBase;
   import controls.containers.Renamed1982;
   import controls.Renamed3955;
   import flash.utils.Dictionary;
   
   public class ExternalEntranceForm extends TankWindow
   {
      [Inject]
      public static var Renamed3564:IExternalEntranceService;
      
      public var Renamed3932:VKButton;
      
      public var Renamed3933:FBButton;
      
      public var Renamed3934:Renamed3955;
      
      private var infoLabel:LabelBase;
      
      private var Renamed3956:Renamed1982;
      
      private var buttons:Dictionary;
      
      public function ExternalEntranceForm(param1:int, param2:int, param3:String)
      {
         var _loc4_:* = null;
         this.Renamed3932 = new VKButton();
         this.Renamed3933 = new FBButton();
         this.Renamed3934 = new Renamed3955();
         this.Renamed3956 = new Renamed1982();
         this.buttons = new Dictionary();
         super(param1,param2);
         this.infoLabel = new LabelBase();
         this.infoLabel.text = param3;
         this.infoLabel.y = 15;
         this.infoLabel.x = param1 / 2 - this.infoLabel.width / 2;
         addChild(this.infoLabel);
         if(Renamed3564.Renamed3602)
         {
            this.buttons["vkontakte"] = this.Renamed3932;
         }
         if(Renamed3564.Renamed3603)
         {
            this.buttons["facebook"] = this.Renamed3933;
         }
         if(Renamed3564.Renamed3604)
         {
            this.buttons["google"] = this.Renamed3934;
         }
         this.Renamed3956.Renamed1987(5);
         for(_loc4_ in this.buttons)
         {
            this.buttons[_loc4_].width = 102;
            this.Renamed3956.addItem(this.buttons[_loc4_]);
         }
         this.Renamed3956.y = 35;
         this.Renamed3956.x = param1 / 2 - this.Renamed3956.width / 2;
         addChild(this.Renamed3956);
      }
   }
}

