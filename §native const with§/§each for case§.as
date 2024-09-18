package §native const with§
{
   import §]!5§.§8"W§;
   import §break set null§.§each for each§;
   import §true for if§.§implements set while§;
   import §var package override§.§native for implements§;
   
   public class §each for case§ extends §each for each§
   {
      private var view:§implements set while§;
      
      private var _width:int;
      
      private var _height:int;
      
      public function §each for case§()
      {
         super();
         this.view = new §implements set while§();
         addChild(this.view);
      }
      
      public function §4D§(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:§8"W§ = new §8"W§(param2,param3,param1);
         this.view.§for set class§(_loc4_);
      }
      
      public function addItem(param1:§native for implements§, param2:String) : void
      {
         this.view.addItem(param2,param1);
      }
      
      override public function render(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this.view.render(param1,param2);
      }
      
      override public function §"j§() : void
      {
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.view.destroy();
         this.view = null;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function §[$ §(param1:String) : void
      {
      }
   }
}

