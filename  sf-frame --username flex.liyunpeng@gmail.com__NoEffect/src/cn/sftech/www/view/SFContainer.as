package cn.sftech.www.view
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class SFContainer extends SFSprite
	{
		public var _contentPane : SFSprite = new SFSprite();
		
		private var _children : Vector.<DisplayObject> = new Vector.<DisplayObject>;
		
		public function SFContainer()
		{
			super();
			super.addChild(_contentPane);
		}
		
		override public function set width(value : Number) : void
		{
			super.width = _contentPane.width = value;
			for each(var obj : DisplayObject in _children) {
				if(obj is SFSprite) {(obj as SFSprite).parentWidth = value;}
			}
		}
		
		override public function set height(value:Number) : void
		{
			super.height = _contentPane.height = value;
			for each(var obj : DisplayObject in _children) {
				if(obj is SFSprite){(obj as SFSprite).parentHeight = value;}
			}
		}
		
		override public function set backgroundColor(value:uint):void
		{
			_contentPane.backgroundColor = value;
		}
		
		override public function set backgroundImage(value:*):void
		{
			_contentPane.backgroundImage = value;
		}
		
		override public function set backgroundAlpha(value:Number):void
		{
			_contentPane.backgroundAlpha = value;
		}
		
		override public function set alpha(value:Number):void
		{
			_contentPane.alpha = value;
			super.alpha = value;
		}
		
		public function get children() : Vector.<DisplayObject>
		{
			return _children;
		}
		
		override public function get numChildren() : int
		{
			return _children.length;
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
z			return addChildAt(child,_children.length);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			if(child is SFSprite) {
				(child as SFSprite).parentWidth = width;
				(child as SFSprite).parentHeight = height;
			}
			_children.splice(index,0,child);
			return _contentPane.addChildAt(child,index);
		}
		
		override public function getChildIndex(child:DisplayObject):int
		{
			return _contentPane.getChildIndex(child);
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			return removeChildAt(_children.indexOf(child));
		}
		
		override public function removeChildAt(index:int): DisplayObject
		{
			_children.splice(index,1);
			return _contentPane.removeChildAt(index);
		}
		
		override public function getChildAt(index:int):DisplayObject
		{
			return _contentPane.getChildAt(index);
		}
		
		override public function updateDisplayList(unscaledWidth:Number,
											unscaledHeight:Number) : void
		{
			_contentPane.updateDisplayList(unscaledWidth,unscaledHeight);
			updateScrollRect(unscaledWidth,unscaledHeight);
//			super.updateDisplayList(unscaledWidth,unscaledHeight);
		}
		
		private function updateScrollRect(unscaledWidth:Number,
										unscaledHeight:Number) : void
		{
			_contentPane.scrollRect = new Rectangle(0,0,unscaledWidth,unscaledHeight);
		}
		
	}
}