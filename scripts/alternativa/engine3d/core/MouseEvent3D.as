package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.events.Event;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class MouseEvent3D extends Event
   {
      public static const CLICK:String = "click3D";
      
      public static const DOUBLE_CLICK:String = "doubleClick3D";
      
      public static const MOUSE_DOWN:String = "mouseDown3D";
      
      public static const MOUSE_UP:String = "mouseUp3D";
      
      public static const MOUSE_OVER:String = "mouseOver3D";
      
      public static const MOUSE_OUT:String = "mouseOut3D";
      
      public static const ROLL_OVER:String = "rollOver3D";
      
      public static const ROLL_OUT:String = "rollOut3D";
      
      public static const MOUSE_MOVE:String = "mouseMove3D";
      
      public static const MOUSE_WHEEL:String = "mouseWheel3D";
      
      public var ctrlKey:Boolean;
      
      public var altKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public var buttonDown:Boolean;
      
      public var delta:int;
      
      public var relatedObject:Object3D;
      
      public var localOrigin:Vector3D;
      
      public var localDirection:Vector3D;
      
      alternativa3d var _target:Object3D;
      
      alternativa3d var _currentTarget:Object3D;
      
      alternativa3d var _bubbles:Boolean;
      
      alternativa3d var _eventPhase:uint = 3;
      
      alternativa3d var stop:Boolean = false;
      
      alternativa3d var stopImmediate:Boolean = false;
      
      public function MouseEvent3D(param1:String, param2:Boolean = true, param3:Object3D = null, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:int = 0)
      {
         this.localOrigin = new Vector3D();
         this.localDirection = new Vector3D();
         super(param1,param2);
         this.relatedObject = param3;
         this.altKey = param4;
         this.ctrlKey = param5;
         this.shiftKey = param6;
         this.buttonDown = param7;
         this.delta = param8;
      }
      
      alternativa3d function calculateLocalRay(param1:Number, param2:Number, param3:Object3D, param4:Camera3D) : void
      {
         param4.calculateRay(this.localOrigin,this.localDirection,param1,param2);
         param3.alternativa3d::composeMatrix();
         var _loc5_:Object3D = param3;
         while(_loc5_.alternativa3d::_parent != null)
         {
            _loc5_ = _loc5_.alternativa3d::_parent;
            _loc5_.alternativa3d::composeMatrix();
            param3.alternativa3d::appendMatrix(_loc5_);
         }
         param3.alternativa3d::invertMatrix();
         var _loc6_:Number = this.localOrigin.x;
         var _loc7_:Number = this.localOrigin.y;
         var _loc8_:Number = this.localOrigin.z;
         var _loc9_:Number = this.localDirection.x;
         var _loc10_:Number = this.localDirection.y;
         var _loc11_:Number = this.localDirection.z;
         this.localOrigin.x = param3.alternativa3d::ma * _loc6_ + param3.alternativa3d::mb * _loc7_ + param3.alternativa3d::mc * _loc8_ + param3.alternativa3d::md;
         this.localOrigin.y = param3.alternativa3d::me * _loc6_ + param3.alternativa3d::mf * _loc7_ + param3.alternativa3d::mg * _loc8_ + param3.alternativa3d::mh;
         this.localOrigin.z = param3.alternativa3d::mi * _loc6_ + param3.alternativa3d::mj * _loc7_ + param3.alternativa3d::mk * _loc8_ + param3.alternativa3d::ml;
         this.localDirection.x = param3.alternativa3d::ma * _loc9_ + param3.alternativa3d::mb * _loc10_ + param3.alternativa3d::mc * _loc11_;
         this.localDirection.y = param3.alternativa3d::me * _loc9_ + param3.alternativa3d::mf * _loc10_ + param3.alternativa3d::mg * _loc11_;
         this.localDirection.z = param3.alternativa3d::mi * _loc9_ + param3.alternativa3d::mj * _loc10_ + param3.alternativa3d::mk * _loc11_;
      }
      
      override public function get bubbles() : Boolean
      {
         return this.alternativa3d::_bubbles;
      }
      
      override public function get eventPhase() : uint
      {
         return this.alternativa3d::_eventPhase;
      }
      
      override public function get target() : Object
      {
         return this.alternativa3d::_target;
      }
      
      override public function get currentTarget() : Object
      {
         return this.alternativa3d::_currentTarget;
      }
      
      override public function stopPropagation() : void
      {
         this.alternativa3d::stop = true;
      }
      
      override public function stopImmediatePropagation() : void
      {
         this.alternativa3d::stopImmediate = true;
      }
      
      override public function clone() : Event
      {
         return new MouseEvent3D(type,this.alternativa3d::_bubbles,this.relatedObject,this.altKey,this.ctrlKey,this.shiftKey,this.buttonDown,this.delta);
      }
      
      override public function toString() : String
      {
         return formatToString("MouseEvent3D","type","bubbles","eventPhase","relatedObject","altKey","ctrlKey","shiftKey","buttonDown","delta");
      }
   }
}

