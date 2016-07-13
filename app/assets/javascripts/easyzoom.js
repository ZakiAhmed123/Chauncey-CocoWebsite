/*!
 * @name        EasyZoom
 * @author      Matt Hinchliffe <>
 * @modified    Monday, April 18th, 2016
 * @version     2.4.0
 */
! function(a) {
  "use strict";

  function b(b, c) {
    this.$target = a(b), this.opts = a.extend({}, i, c, this.$target.data()), void 0 === this.isOpen && this._init()
  }
  var c, d, e, f, g, h, i = {
    loadingNotice: "Loading image",
    errorNotice: "The image could not be loaded",
    errorDuration: 2500,
    linkAttribute: "href",
    preventClicks: !0,
    beforeShow: a.noop,
    beforeHide: a.noop,
    onShow: a.noop,
    onHide: a.noop,
    onMove: a.noop
  };
  b.prototype._init = function() {
    this.$link = this.$target.find("a"), this.$image = this.$target.find("img"), this.$flyout = a('<div class="easyzoom-flyout" />'), this.$notice = a('<div class="easyzoom-notice" />'), this.$target.on({
      "mousemove.easyzoom touchmove.easyzoom": a.proxy(this._onMove, this),
      "mouseleave.easyzoom touchend.easyzoom": a.proxy(this._onLeave, this),
      "mouseenter.easyzoom touchstart.easyzoom": a.proxy(this._onEnter, this)
    }), this.opts.preventClicks && this.$target.on("click.easyzoom", function(a) {
      a.preventDefault()
    })
  }, b.prototype.show = function(a, b) {
    var g, h, i, j, k = this;
    if (this.opts.beforeShow.call(this) !== !1) {
      if (!this.isReady) return this._loadImage(this.$link.attr(this.opts.linkAttribute), function() {
        (k.isMouseOver || !b) && k.show(a)
      });
      this.$target.append(this.$flyout), g = this.$target.width(), h = this.$target.height(), i = this.$flyout.width(), j = this.$flyout.height(), c = this.$zoom.width() - i, d = this.$zoom.height() - j, e = c / g, f = d / h, this.isOpen = !0, this.opts.onShow.call(this), a && this._move(a)
    }
  }, b.prototype._onEnter = function(a) {
    var b = a.originalEvent.touches;
    this.isMouseOver = !0, b && 1 != b.length || (a.preventDefault(), this.show(a, !0))
  }, b.prototype._onMove = function(a) {
    this.isOpen && (a.preventDefault(), this._move(a))
  }, b.prototype._onLeave = function() {
    this.isMouseOver = !1, this.isOpen && this.hide()
  }, b.prototype._onLoad = function(a) {
    a.currentTarget.width && (this.isReady = !0, this.$notice.detach(), this.$flyout.html(this.$zoom), this.$target.removeClass("is-loading").addClass("is-ready"), a.data.call && a.data())
  }, b.prototype._onError = function() {
    var a = this;
    this.$notice.text(this.opts.errorNotice), this.$target.removeClass("is-loading").addClass("is-error"), this.detachNotice = setTimeout(function() {
      a.$notice.detach(), a.detachNotice = null
    }, this.opts.errorDuration)
  }, b.prototype._loadImage = function(b, c) {
    var d = new Image;
    this.$target.addClass("is-loading").append(this.$notice.text(this.opts.loadingNotice)), this.$zoom = a(d).on("error", a.proxy(this._onError, this)).on("load", c, a.proxy(this._onLoad, this)), d.style.position = "absolute", d.src = b
  }, b.prototype._move = function(a) {
    if (0 === a.type.indexOf("touch")) {
      var b = a.touches || a.originalEvent.touches;
      g = b[0].pageX, h = b[0].pageY
    } else g = a.pageX || g, h = a.pageY || h;
    var i = this.$target.offset(),
      j = h - i.top,
      k = g - i.left,
      l = Math.ceil(j * f),
      m = Math.ceil(k * e);
    if (0 > m || 0 > l || m > c || l > d) this.hide();
    else {
      var n = -1 * l,
        o = -1 * m;
      this.$zoom.css({
        top: n,
        left: o
      }), this.opts.onMove.call(this, n, o)
    }
  }, b.prototype.hide = function() {
    this.isOpen && this.opts.beforeHide.call(this) !== !1 && (this.$flyout.detach(), this.isOpen = !1, this.opts.onHide.call(this))
  }, b.prototype.swap = function(b, c, d) {
    this.hide(), this.isReady = !1, this.detachNotice && clearTimeout(this.detachNotice), this.$notice.parent().length && this.$notice.detach(), this.$target.removeClass("is-loading is-ready is-error"), this.$image.attr({
      src: b,
      srcset: a.isArray(d) ? d.join() : d
    }), this.$link.attr(this.opts.linkAttribute, c)
  }, b.prototype.teardown = function() {
    this.hide(), this.$target.off(".easyzoom").removeClass("is-loading is-ready is-error"), this.detachNotice && clearTimeout(this.detachNotice), delete this.$link, delete this.$zoom, delete this.$image, delete this.$notice, delete this.$flyout, delete this.isOpen, delete this.isReady
  }, a.fn.easyZoom = function(c) {
    return this.each(function() {
      var d = a.data(this, "easyZoom");
      d ? void 0 === d.isOpen && d._init() : a.data(this, "easyZoom", new b(this, c))
    })
  }, "function" == typeof define && define.amd ? define(function() {
    return b
  }) : "undefined" != typeof module && module.exports && (module.exports = b)
}(jQuery);
