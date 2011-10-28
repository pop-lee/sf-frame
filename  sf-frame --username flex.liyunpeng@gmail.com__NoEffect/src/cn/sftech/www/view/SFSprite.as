package cn.sftech.www.view
{
	
	import cn.sftech.www.core.BdcBackgroundType;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.errors.IllegalOperationError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.text.TextField;
	import flash.utils.describeType;
	
	/**
	 * @author LiYunpeng
	 */	
	public class SFSprite extends MovieClip
	{
		private var _scaleX : Number = 1;
		
		private var _scaleY : Number = 1;
		
		private var _parentWidth : Number = 0;
		
		private var _parentHeight : Number = 0;
		
		private var _width : Number = 0;
		
		private var _height : Number = 0;
		
		private var _percentWidth : Number = 0;
		
		private var _percentHeight : Number = 0;
		
		private var _isPercentWidth : Boolean = false;
		private var _isPercentHeight : Boolean = false;
		
		private var _backgroundColor : uint = 0xffffff;
		
		private var _backgroundImageResource : Class;
		
		private var _useBackGroundType : String = BdcBackgroundType.COLOR;
		
		private var _backgroundAlpha : Number = 1;
		
		private var _backgroundMovieClip : MovieClip = new MovieClip();
		
		public function SFSprite()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			super.addChild(_backgroundMovieClip);
//			_backgroundImageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadBackgroundImage);
		}
		
		public function set parentWidth(value : Number) : void
		{
			_parentWidth = value;
			if(_isPercentWidth) {
				width = _parentWidth * _percentWidth / 100;
				_isPercentWidth = true;
			}
			updateDisplayList(_width,_height);
		}
		public function set parentHeight(value : Number) : void
		{
			_parentHeight = value;
			if(_isPercentHeight) {
				height = _parentHeight * _percentHeight /100;
				_isPercentHeight = true;
			}
			updateDisplayList(_width,_height);
		}
		
		override public function set width(value : Number) : void
		{
			_width = value;
			_isPercentWidth = false;
			updateDisplayList(_width,_height);
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			_isPercentHeight = false;
			updateDisplayList(_width,_height);
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			return super.addChild(child);
		}
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			return super.addChildAt(child,index+1);
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			return super.removeChild(child);
		}
		
		override public function removeChildAt(index:int):DisplayObject
		{
			return super.removeChildAt(index+1);
		}
		override public function getChildAt(index:int):DisplayObject
		{
			return super.getChildAt(index+1);
		}
		
		public function set percentWidth(value : Number) : void
		{
			_percentWidth = value;
			width = _parentWidth * _percentWidth / 100;
			_isPercentWidth = true;
			updateDisplayList(_width,_height);
		}
		public function set percentHeight(value : Number) : void
		{
			_percentHeight =value;
			height = _parentHeight * _percentHeight / 100;
			_isPercentHeight = true;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundColor(value : uint) : void
		{
			_backgroundColor = value;
			_useBackGroundType = BdcBackgroundType.COLOR;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundAlpha(value : Number) : void
		{
			_backgroundAlpha = value;
			updateDisplayList(_width,_height);
		}
		
		public function set backgroundImage(value : *) : void
		{
//			if(value is String) {
//				_backgroundImageLoader.load(new URLRequest(value));
//			} else if(value is Bitmap) {
//				backgroundBitmap(value);
//			}
//			else 
//			if(value is MovieClip) {
//				_backgroundMovieClip = value;
//			}
			if(value is Class) {
				backgroundBitmap(value);
			}
		}
		
//		public function get backgroundImage() : Bitmap
//		{
//			return _backgroundImage;
//		}
		
		override public function get width() : Number
		{
			return _width;
		}
		override public function get height() : Number
		{
			return _height;
		}
		
		public function set top(value : Number) : void
		{
			this.y = value;
		}
		public function set bottom(value : Number) : void
		{
			this.y = this.parent.height - value;
		}
		public function set left(value : Number) : void
		{
			this.x = value;
		}
		public function set right(value : Number) : void
		{
			this.x = this.parent.width - value;
		}
		
		/**
		 * 为统一管理事件，统一在此处添加事件
		 */
		private function addEvent():void
		{
			
		}
		
		/**
		 * 为统一管理事件，统一在此处删除事件
		 */
		private function removeEvent():void
		{
		}
		
		/**
		 * 当页面发生变化的时候，以此方法来操作
		 */
		public function updateDisplayList(unscaledWidth:Number,
										  unscaledHeight:Number) : void
		{
			this.scaleX = _scaleX;
			this.scaleY = _scaleY;
			
			if(_useBackGroundType == BdcBackgroundType.MOVIECLIP) {
				removeChild(_backgroundMovieClip);
				_backgroundMovieClip = new _backgroundImageResource();
				super.addChildAt(_backgroundMovieClip,0);
				System.gc();
			} else if(_useBackGroundType == BdcBackgroundType.BITMAP) {
				drawBackgroundImage(getImage().bitmapData);
			} else {
				drawBackground(unscaledWidth,unscaledHeight);
			}
		}
		
		private function drawBackground(unscaledWidth:Number,
										unscaledHeight:Number) : void
		{
			_backgroundMovieClip.graphics.clear();
			_backgroundMovieClip.graphics.beginFill(_backgroundColor,_backgroundAlpha);
			_backgroundMovieClip.graphics.drawRect(0,0,unscaledWidth,unscaledHeight);
			_backgroundMovieClip.graphics.endFill();
		}
		
		public function drawBackgroundImage(bitmapData : BitmapData) : void
		{
			_backgroundMovieClip.graphics.clear();
			_backgroundMovieClip.graphics.beginBitmapFill(bitmapData);
			_backgroundMovieClip.graphics.drawRect(0,0,bitmapData.width,bitmapData.height);
			_backgroundMovieClip.graphics.endFill();
			
			System.gc();
//			bitmapData.dispose();
		}
		
//		private function loadBackgroundImage(event : Event) : void
//		{
//			backgroundBitmap(_backgroundImageLoader.content as Bitmap);
//		}
		
		private function backgroundBitmap(bitmap : Class) : void
		{
			_backgroundImageResource = bitmap;
			var cls : * = new _backgroundImageResource();
			if(cls is MovieClip) {
				_useBackGroundType = BdcBackgroundType.MOVIECLIP;
			} else if(cls is Bitmap || cls is BitmapData) {
				_useBackGroundType = BdcBackgroundType.BITMAP;
			}
			
			updateDisplayList(_width,_height);
		}
		
		private function getImage() : Bitmap
		{
			var bitmap : Bitmap = new Bitmap();
			var cls : * = new _backgroundImageResource();
			if(cls is Bitmap) {
				bitmap = cls;
			} else if(cls is MovieClip) {
//				bitmap = (cls as MovieClip).getChildAt(0) as Bitmap;
			} else if(cls is BitmapData) {
				bitmap = new Bitmap(cls);
			}
			return bitmap;
		}
	}
}