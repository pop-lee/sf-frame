package cn.sftech.www.effect.viewStackEffect
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.effect.base.SFEffectBase;
	import cn.sftech.www.effect.base.SFEffectGroup;
	import cn.sftech.www.effect.base.SFViewStackEffect;
	import cn.sftech.www.event.SFHideEvent;
	import cn.sftech.www.event.SFShowEvent;
	
	import com.greensock.data.TweenLiteVars;
	
	import flash.display.DisplayObject;

	public class SFViewStackListEffect extends SFViewStackEffect
	{
		private var _baseIndex : uint;
		
		//表示变化的方向，用1表示正序和-1表示倒序
		private var _direction : int;
		
		private var _showEffect : SFMoveEffect = new SFMoveEffect();
		
		private var _hideEffect : SFMoveEffect = new SFMoveEffect();
		
		public function SFViewStackListEffect()
		{
			super();
		}
		
//		override public function get showEffect():SFEffectBase
//		{
//			var effect : SFMoveEffect = new SFMoveEffect();
//			target.getChildAt(target.selectedIndex).visible = true;
//			effect.target = target.getChildAt(target.selectedIndex);
//			effect.duration = _duration;
////			if(_viewStack.selectedIndex > _viewStack.oldSelectIndex) {
////				_viewStack.getChildAt(_viewStack.selectedIndex).x = _viewStack.width;
////			} else {
////				_viewStack.getChildAt(_viewStack.selectedIndex).x = -_viewStack.width;
////			}
//			effect.xTo = 0;
//			effect.vars = _vars;
//			
//			return effect;
//		}
//		
//		override public function get hideEffect():SFEffectBase
//		{
//			var effect : SFMoveEffect = new SFMoveEffect();
//			var _target : DisplayObject = target.getChildAt(target.oldSelectIndex);
//			_target.addEventListener(SFShowEvent.SHOW_EVENT,show);
//			effect.target = _target;
//			effect.duration = _duration;
//			if(target.selectedIndex > target.oldSelectIndex) {
//				effect.xTo = -_target.width;
//			} else {
//				effect.xTo = _target.width;
//			}
//			effect.onComplete = hideOnComplete;
//			
//			return effect;
//		}
		
		override protected function playEffect() : void
		{
			_baseIndex = target.oldSelectIndex;
			_showEffect.duration = this.duration/Math.abs(target.selectedIndex - target.oldSelectIndex);
			_hideEffect.duration = this.duration/Math.abs(target.selectedIndex - target.oldSelectIndex);
			if(target.selectedIndex > target.oldSelectIndex) {
				_direction = 1;
				_showEffect.xFrom = target.width;
				_showEffect.xTo = 0;
				_hideEffect.xFrom = 0;
				_hideEffect.xTo = -target.width;
				_hideEffect.onComplete = hideOnComplete;
			} else if(target.selectedIndex < target.oldSelectIndex) {
				_direction = -1;
				_showEffect.xFrom = -target.width;
				_showEffect.xTo = 0;
				_hideEffect.xFrom = 0;
				_hideEffect.xTo = target.width;
				_hideEffect.onComplete = hideOnComplete;
			}
			toListNext();
			
//			for(var i : int = Math.min(target.selectedIndex,target.oldSelectIndex);
//				i <  Math.max(target.selectedIndex,target.oldSelectIndex);
//				i++) {
//				target.getChildAt(i).visible = false;
//				target.getChildAt(i+1).visible = true;
//			}
		}
		
		override protected function stopEffect():void
		{
			
		}
		
		private function toListNext() : void
		{
			if(_baseIndex == target.selectedIndex) return;
			show(target.getItemAt(_baseIndex+_direction));
			hide(target.getItemAt(_baseIndex));
			_baseIndex += _direction;
		}
		
		private function show(object : DisplayObject) : void
		{
			object.visible = true;
			_showEffect.target = object;
			_showEffect.play();
		}
		
		private function hide(object : DisplayObject) : void
		{
			object.visible = true;
			_hideEffect.target = object;
			_hideEffect.play();
		}
	
		
//		override protected function show(event : SFShowEvent) : void
//		{
//			if(_effectSwitch) {
//				var child : DisplayObject = event.currentTarget as DisplayObject;
//				child.visible = true;
//				var moveEffect : SFMoveEffect = new SFMoveEffect();
//				moveEffect.target = child;
//				if(target.selectedIndex > target.oldSelectIndex) {
//					moveEffect.xFrom = child.width;
//					moveEffect.xTo = 0;
//					moveEffect.play();
//				} else {
//					moveEffect.xFrom = -child.width;
//					moveEffect.xTo = 0;
//					moveEffect.play();
//				}
//			}
//		}
//		
//		override protected function hide(event : SFHideEvent) : void
//		{
//			if(_effectSwitch) {
//				var child : DisplayObject = event.currentTarget as DisplayObject;
//				child.visible = true;
//				var moveEffect : SFMoveEffect = new SFMoveEffect();
//				moveEffect.target = child;
//				moveEffect.onComplete = hideOnComplete;
//				if(target.selectedIndex > target.oldSelectIndex) {
//					moveEffect.xFrom = 0;
//					moveEffect.xTo = -child.width;
//					moveEffect.play();
//				} else {
//					moveEffect.xFrom = 0;
//					moveEffect.xTo = child.width;
//					moveEffect.play();
//				}
//			}
//		}
		
		private function showOncomplete() : void
		{
			
		}
		
		private function hideOnComplete() : void
		{
			toListNext();
			target.getChildAt(_baseIndex-_direction).visible = false;
			
//			_effectSwitch = false;
//			target.getChildAt(target.oldSelectIndex).visible = false;
//			_effectSwitch = true;
		}
	}
}