package Renamed333
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.camera.Renamed1457;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.camera.Renamed611;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class Renamed2382 extends Renamed1457 implements Renamed611
   {
      [Inject]
      public static var display:IDisplay;
      
      private static const Renamed7873:ConsoleVarFloat = new ConsoleVarFloat("cam_smooth",0.1,0.001,1);
      
      private static const Renamed7874:ConsoleVarFloat = new ConsoleVarFloat("m_pitch",-0.006,-100,100);
      
      private static const Renamed7875:ConsoleVarFloat = new ConsoleVarFloat("m_yaw",-0.006,-100,100);
      
      private static const Renamed7836:ConsoleVarFloat = new ConsoleVarFloat("cam_spd",1300,0,10000);
      
      private static const Renamed7837:ConsoleVarFloat = new ConsoleVarFloat("cam_acc",4,0,1000000);
      
      private static const Renamed7876:ConsoleVarFloat = new ConsoleVarFloat("yaw_speed",1,-10,10);
      
      private static const Renamed7877:ConsoleVarFloat = new ConsoleVarFloat("pitch_speed",1,-10,10);
      
      private var Renamed7878:Boolean;
      
      private var Renamed7879:Number;
      
      private var Renamed7880:Number;
      
      private var Renamed7881:Number;
      
      private var Renamed7882:Number;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var Renamed7883:Vector3;
      
      private var Renamed7884:Renamed7857;
      
      private var Renamed7885:Vector.<Renamed7849>;
      
      private var Renamed7886:Renamed7839;
      
      public var Renamed7887:Renamed4662;
      
      private var Renamed7888:Boolean = false;
      
      public function Renamed2382()
      {
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.Renamed7883 = new Vector3();
         this.Renamed7886 = new Renamed7862();
         super();
         this.Renamed7887 = new Renamed4662(this);
         this.Renamed7885 = Vector.<Renamed7849>([new Renamed7852(this),this.Renamed7886,this.Renamed7887,new Renamed7848()]);
         this.Renamed7889();
         this.Renamed7884 = new Renamed7857(Vector.<Renamed7835>([new Renamed7890(Renamed7836,Renamed7837),new Renamed7834(Renamed7836,Renamed7837)]));
      }
      
      private static function Renamed7891(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = (param2 - param1) % (2 * Math.PI);
         if(_loc3_ > Math.PI)
         {
            return _loc3_ - 2 * Math.PI;
         }
         if(_loc3_ < -Math.PI)
         {
            return 2 * Math.PI + _loc3_;
         }
         return _loc3_;
      }
      
      public function Renamed7856(param1:Vector3, param2:Vector3) : void
      {
         this.Renamed7887.Renamed7892();
         this.position.copy(param1);
         this.rotation.copy(param2);
         var _loc3_:Renamed842 = Renamed739();
         this.Renamed7883.x = Renamed7891(_loc3_.rotationX,param2.x);
         this.Renamed7883.y = Renamed7891(_loc3_.rotationY,param2.y);
         this.Renamed7883.z = Renamed7891(_loc3_.rotationZ,param2.z);
      }
      
      override public function update(param1:int, param2:int) : void
      {
         if(Renamed739() != null)
         {
            this.Renamed7893(param2);
            this.Renamed7894(param2 / 1000);
            this.Renamed7895();
         }
      }
      
      private function Renamed7893(param1:int) : void
      {
         var _loc2_:Vector3 = null;
         _loc2_ = this.Renamed7884.Renamed7860().Renamed7838(this.Renamed7886,Renamed739(),param1 / 1000);
         this.position.x += _loc2_.x;
         this.position.y += _loc2_.y;
         this.position.z += _loc2_.z;
      }
      
      private function Renamed7894(param1:Number) : void
      {
         var _loc2_:Renamed842 = null;
         _loc2_ = Renamed739();
         if(this.Renamed7878)
         {
            this.rotation.x = this.Renamed7881 + (display.stage.mouseY - this.Renamed7880) * Renamed7874.value;
            this.rotation.x = MathUtils.clamp(this.rotation.x,-Math.PI,0);
            this.Renamed7883.x = this.rotation.x - _loc2_.rotationX;
            this.rotation.z = this.Renamed7882 + (display.stage.mouseX - this.Renamed7879) * Renamed7875.value;
            this.Renamed7883.z = this.rotation.z - _loc2_.rotationZ;
         }
         else if(this.Renamed7886.isRotating())
         {
            this.rotation.x += this.Renamed7886.Renamed7846() * Renamed7877.value * param1;
            this.rotation.x = MathUtils.clamp(this.rotation.x,-Math.PI,0);
            this.Renamed7883.x = this.rotation.x - _loc2_.rotationX;
            this.Renamed7883.z += this.Renamed7886.Renamed7845() * Renamed7876.value * param1;
         }
      }
      
      private function Renamed7895() : void
      {
         this.Renamed7896();
         this.Renamed7897();
      }
      
      private function Renamed7896() : void
      {
         var _loc1_:Renamed842 = Renamed739();
         _loc1_.x += (this.position.x - _loc1_.x) * Renamed7873.value;
         _loc1_.y += (this.position.y - _loc1_.y) * Renamed7873.value;
         _loc1_.z += (this.position.z - _loc1_.z) * Renamed7873.value;
      }
      
      private function Renamed7897() : void
      {
         var _loc1_:Renamed842 = null;
         _loc1_ = Renamed739();
         var _loc2_:Number = this.Renamed7883.x * Renamed7873.value;
         _loc1_.rotationX += _loc2_;
         this.Renamed7883.x -= _loc2_;
         var _loc3_:Number = this.Renamed7883.y * Renamed7873.value;
         _loc1_.rotationY += _loc3_;
         this.Renamed7883.y -= _loc3_;
         var _loc4_:Number = this.Renamed7883.z * Renamed7873.value;
         _loc1_.rotationZ += _loc4_;
         this.Renamed7883.z -= _loc4_;
      }
      
      override public function activate() : void
      {
         super.activate();
         this.Renamed7883.reset();
         this.Renamed2388();
      }
      
      public function Renamed7889() : void
      {
         var _loc1_:Renamed842 = null;
         _loc1_ = Renamed739();
         this.position.x = _loc1_.x;
         this.position.y = _loc1_.y;
         this.position.z = _loc1_.z;
         this.rotation.x = _loc1_.rotationX;
         this.rotation.y = _loc1_.rotationY;
         this.rotation.z = _loc1_.rotationZ;
      }
      
      override public function deactivate() : void
      {
         this.Renamed7886.reset();
         this.Renamed7883.reset();
         this.Renamed2387();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.Renamed7878 = true;
         this.Renamed7879 = param1.stageX;
         this.Renamed7880 = param1.stageY;
         var _loc2_:Renamed842 = Renamed739();
         this.Renamed7881 = _loc2_.rotationX;
         this.Renamed7882 = _loc2_.rotationZ;
         display.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed7849 = null;
         for each(_loc2_ in this.Renamed7885)
         {
            _loc2_.Renamed7851(param1);
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Renamed7849 = null;
         if(param1.keyCode == Keyboard.SPACE)
         {
            this.Renamed7884.Renamed7861();
         }
         for each(_loc2_ in this.Renamed7885)
         {
            _loc2_.Renamed2516(param1);
         }
      }
      
      private function Renamed7898() : void
      {
         if(this.Renamed7878)
         {
            display.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            this.Renamed7878 = false;
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.Renamed7898();
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         this.Renamed7887.close();
      }
      
      public function Renamed2387() : void
      {
         var _loc1_:Stage = null;
         this.Renamed7898();
         if(this.Renamed7888)
         {
            _loc1_ = display.stage;
            _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc1_.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _loc1_.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.Renamed7888 = false;
         }
      }
      
      public function Renamed2388() : void
      {
         var _loc1_:Stage = null;
         if(!this.Renamed7888)
         {
            _loc1_ = display.stage;
            _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc1_.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _loc1_.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            this.Renamed7888 = true;
         }
      }
   }
}

