const canvasSketch = require('canvas-sketch');
const createShader = require('canvas-sketch-util/shader');
const glsl = require('glslify');
const _ = require('underscore');

// Setup our sketch
const settings = {
  context: 'webgl',
  animate: true,
  dimensions: [380, 679]
};

// Your glsl code
const frag = glsl.file('./shaders/shader.glsl');

// Custom markup
const makeMark = (width, height) => {
  const markElement = document.createElement('div');
  Object.assign(markElement.style, {
    position: 'absolute',
    top: '50%',
    left: '50%',
    zIndex: '10',
    transform: 'translate(-50%, -50%)',
    background: 'url(./sketches/images/tarot-merge.png) center center',
    backgroundSize: 'cover',
    borderRadius: '25px',
    border: '10px solid black',
    width: `${width}px`,
    height: `${height}px`
  });

  const canvas = document.querySelector('canvas');
  canvas.after(markElement);

  return markElement;
}

// Your sketch, which simply returns the shader
const sketch = ({ gl, styleWidth, styleHeight, canvas }) => {
  const markElement = makeMark(styleWidth, styleHeight);
  canvas.style.borderRadius = '20px';

  const canvasSizeCache = { width: styleWidth, height: styleHeight };
  window.addEventListener('resize', _.throttle(() => {
    const { clientWidth, clientHeight } = canvas;
    const { width, height } = canvasSizeCache;
    if (clientWidth !== width || clientHeight !== height) {
      markElement.style.width = `${clientWidth}px`;
      markElement.style.height = `${clientHeight}px`;

      canvasSizeCache.width = clientWidth;
      canvasSizeCache.height = clientHeight;
    }
  }, 500));

  // Create the shader and return it
  return createShader({
    // Pass along WebGL context
    gl,
    // Specify fragment and/or vertex shader strings
    frag,
    // Specify additional uniforms to pass down to the shaders
    uniforms: {
      u_resolution: [canvas.width, canvas.height]
    }
  })
};

canvasSketch(sketch, settings);
