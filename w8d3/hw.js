function titleize(names, callBack){
  let titleizedNames = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callBack(titleizedNames);
};

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});