package alternativa.proplib.objects
{
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.utils.textureutils.TextureByteData;
   
   public class PropSprite extends PropObject
   {
      public var textureData:TextureByteData;
      
      public var scale:Number;
      
      public function PropSprite(param1:TextureByteData, param2:Number = 0.5, param3:Number = 0.5, param4:Number = 1)
      {
         super(PropObjectType.SPRITE);
         this.textureData = param1;
         this.scale = param4;
         var _loc5_:Sprite3D;
         (_loc5_ = new Sprite3D(1,1)).originX = param2;
         _loc5_.originY = param3;
         object = _loc5_;
      }
      
      override public function traceProp() : void
      {
         super.traceProp();
      }
   }
}

