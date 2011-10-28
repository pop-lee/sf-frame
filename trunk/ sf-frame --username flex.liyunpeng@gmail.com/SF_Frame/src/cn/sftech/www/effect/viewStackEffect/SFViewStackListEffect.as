package cn.sftech.www.effect.viewStackEffect
{
	import cn.sftech.www.effect.SFMoveEffect;
	import cn.sftech.www.effect.base.SFEffect;
	import cn.sftech.www.effect.base.SFEffectGroup;
	import cn.sftech.www.effect.base.SFViewStackEffect;
	import cn.sftech.www.event.SFHideEvent;
	import cn.sftech.www.event.SFShowEvent;
	
	import com.greensock.data.TweenLiteVars;
	
	import flash.display.DisplayObject;

	public class SFViewStackListEffect extends SFViewStackEffect
	{
		public function SFViewStackListEffect()
		{
			super();
		}
		
		override public function get showEffect():SFEffect
		{
			var effect : SFMoveEffect = new SFMoveEffect();
			target.getChildAt(target.selectedIndex).visible = true;
			effect.target = target.getChildAt(target.selectedIndex);
			effect.duration = _duration;
//			if(_viewStack.selectedIndex > _viewStack.oldSelectIndex) {
//				_viewStack.getChildAt(_viewStack.selectedIndex).x = _viewStack.width;
//			} else {
//				_viewStack.getChildAt(_viewStack.selectedIndex).x = -_viewStack.width;
//			}
			effect.xTo = 0;
			effect.vars = _vars;
			
			return effect;
		}
		
		override public function get hideEffect():SFEffect
		{
			var effect : SFMoveEffect = new SFMoveEffect();
			var _target : DisplayObject = target.getChildAt(target.oldSelectIndex);
			_target.addEventListener(SFShowEvent.SHOW_EVENT,show);
			effect.target = _target;
			effect.duration = _duration;
			if(target.selectedIndex > target.oldSelectIndex) {
				effect.xTo = -_target.width;
			} else {
				effect.xTo = _target.width;
			}
			effect.onComplete = hideOnComplete;
			
			return effect;
		}
		
		public function play() : void
		{
			for each(var child : DisplayObject in target.children) {
				child.addEventListener(SFShowEvent.SHOW_EVENT,show);
				child.addEventListener(SFHideEvent.HIDE_EVENT,hide);
			}
			
			for(var i : int = Math.min(target.selectedIndex,target.oldSelectIndex);
				i <  Math.max(target.selectedIndex,target.oldSelectIndex);
				i++) {
				target.getChildAt(i).visible = false;
				target.getChildAt(i+1).visible = true;
			}
		}
		
		private function show(event : SFShowEvent) : void
		{
			var child : DisplayObject = event.currentTarget as DisplayObject;
			child.visible = true;
			if(target.selectedIndex > target.oldSelectIndex) {
				
			}
		}
		
		private function hide(event : SFHideEvent) : void
		{
			event.currentTarget.visible = true;
		}
		
		private function showOncomplete() : void
		{
			
		}
		
		private function hideOnComplete() : void
		{
			target.getChildAt(target.oldSelectIndex).visible = false;
		}
	}
}