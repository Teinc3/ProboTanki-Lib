package alternativa.tanks.gui.friends
{
   import controls.base.ColorButtonBase;
   import controls.friends.RequestCountIndicator;
   import flash.events.MouseEvent;
   
   public class FriendStateButton extends ColorButtonBase
   {
      private static const ButtonCenter:Class = FriendStateButton_ButtonCenter;
      
      private static const ButtonLeft:Class = FriendStateButton_ButtonLeft;
      
      private static const ButtonRight:Class = FriendStateButton_ButtonRight;
      
      private static const ButtonOverCenter:Class = FriendStateButton_ButtonOverCenter;
      
      private static const ButtonOverLeft:Class = FriendStateButton_ButtonOverLeft;
      
      private static const ButtonOverRight:Class = FriendStateButton_ButtonOverRight;
      
      private static const ButtonDownCenter:Class = FriendStateButton_ButtonDownCenter;
      
      private static const ButtonDownLeft:Class = FriendStateButton_ButtonDownLeft;
      
      private static const ButtonDownRight:Class = FriendStateButton_ButtonDownRight;
      
      private static const LABEL_MARGIN:int = 26;
      
      private var _type:FriendsWindowState;
      
      private var _requestCounter:RequestCountIndicator;
      
      public function FriendStateButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.setStyle();
         this._requestCounter = new RequestCountIndicator();
         addChild(this._requestCounter);
         this._requestCounter.y = -6;
      }
      
      override public function setStyle(param1:String = "def") : void
      {
         stateUP.bmpLeft = new ButtonLeft().bitmapData;
         stateUP.bmpCenter = new ButtonCenter().bitmapData;
         stateUP.bmpRight = new ButtonRight().bitmapData;
         stateOVER.bmpLeft = new ButtonOverLeft().bitmapData;
         stateOVER.bmpCenter = new ButtonOverCenter().bitmapData;
         stateOVER.bmpRight = new ButtonOverRight().bitmapData;
         stateDOWN.bmpLeft = new ButtonDownLeft().bitmapData;
         stateDOWN.bmpCenter = new ButtonDownCenter().bitmapData;
         stateDOWN.bmpRight = new ButtonDownRight().bitmapData;
         stateOFF.bmpLeft = new ButtonDownLeft().bitmapData;
         stateOFF.bmpCenter = new ButtonDownCenter().bitmapData;
         stateOFF.bmpRight = new ButtonDownRight().bitmapData;
      }
      
      public function get type() : FriendsWindowState
      {
         return this._type;
      }
      
      public function set type(param1:FriendsWindowState) : void
      {
         this._type = param1;
      }
      
      override protected function onMouseEvent(param1:MouseEvent) : void
      {
         if(enable)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(2);
                  break;
               case MouseEvent.MOUSE_OUT:
                  this.setState(1);
                  break;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(3);
                  break;
               case MouseEvent.MOUSE_UP:
                  this.setState(1);
            }
         }
      }
      
      override protected function setState(param1:int = 0) : void
      {
         switch(param1)
         {
            case 0:
               stateOFF.alpha = 1;
               stateUP.alpha = 0;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 0;
               _label.y = 7;
               break;
            case 1:
               stateOFF.alpha = 0;
               stateUP.alpha = 1;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 0;
               _label.y = 6;
               break;
            case 2:
               stateOFF.alpha = 0;
               stateUP.alpha = 0;
               stateOVER.alpha = 1;
               stateDOWN.alpha = 0;
               _label.y = 6;
               break;
            case 3:
               stateOFF.alpha = 0;
               stateUP.alpha = 0;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 1;
               _label.y = 7;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:int = Math.ceil(_label.textWidth) + LABEL_MARGIN;
         if(_loc2_ > param1)
         {
            super.width = _loc2_;
         }
         else
         {
            super.width = param1;
         }
         this._requestCounter.x = _width + 3;
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      public function setRequestCount(param1:int, param2:int) : void
      {
         this._requestCounter.setRequestCount(param1,param2);
      }
      
      public function set currentRequestCount(param1:int) : void
      {
         this._requestCounter.currentCount = param1;
      }
      
      public function set newRequestCount(param1:int) : void
      {
         this._requestCounter.newCount = param1;
      }
   }
}

