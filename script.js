const canvas=document.getElementById('canvas');
const ctx=canvas.getContext('2d');
const nSlider=document.getElementById('n');
const kSlider=document.getElementById('k');
const nOut=document.getElementById('nVal');
const kOut=document.getElementById('kVal');
const animChk=document.getElementById('anim');
const speedSlider=document.getElementById('speed'); const speedOut=document.getElementById('speedVal');

function fitHiDPI(){
  const dpr=window.devicePixelRatio||1;
  const rect=canvas.getBoundingClientRect();
  canvas.width=Math.round(rect.width*dpr);
  canvas.height=Math.round(rect.width*dpr);
  ctx.setTransform(dpr,0,0,dpr,0,0);
}
function draw(n,k){
  fitHiDPI();
  ctx.clearRect(0,0,canvas.width,canvas.height);
  const dpr=window.devicePixelRatio||1;
  const cx=canvas.width/dpr/2, cy=cx, pad=20, R=cx-pad;
  const pts=[];
  for(let i=0;i<n;i++){
    const a=2*Math.PI*i/n-Math.PI/2;
    pts.push([cx+R*Math.cos(a), cy+R*Math.sin(a)]);
  }
  ctx.beginPath(); ctx.arc(cx,cy,R,0,Math.PI*2); ctx.strokeStyle='#999'; ctx.lineWidth=1; ctx.stroke();
  ctx.lineWidth=0.7;
  for(let i=0;i<n;i++){
    const j=(i*k)%n;
    const [x1,y1]=pts[i],[x2,y2]=pts[j];
    ctx.beginPath(); ctx.moveTo(x1,y1); ctx.lineTo(x2,y2);
    ctx.strokeStyle=`hsl(${(i*360/n)|0} 70% 45%)`; ctx.stroke();
  }
}
function update(){
  const n=parseInt(nSlider.value,10);
  const k=parseInt(kSlider.value,10);
  nOut.textContent=n; kOut.textContent=k; draw(n,k);
}
let raf=0,kFloat=parseFloat(kSlider.value);
function loop(){
  const speed=parseFloat(speedSlider.value);
  kFloat+=speed;
  if(kFloat>parseInt(kSlider.max))kFloat=1;
  kSlider.value=Math.round(kFloat);
  update();
  raf=requestAnimationFrame(loop);
}
speedOut.textContent=speedSlider.value;
addEventListener('resize',update);
nSlider.addEventListener('input',update);
kSlider.addEventListener('input',()=>{kFloat=parseFloat(kSlider.value);update();});
animChk.addEventListener('change',()=>{if(animChk.checked){cancelAnimationFrame(raf);loop();}else{cancelAnimationFrame(raf);}});
speedSlider.addEventListener('input',()=>{speedOut.textContent=speedSlider.value;});
update();
