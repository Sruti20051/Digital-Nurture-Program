import './App.css';

function App() {

  const element = "Office Space";

  const office = {
    Name: "DBS",
    Rent: 50000,
    Address: "Chennai"
  };

  const image =
    "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=600";

  return (
    <div style={{ padding: "20px" }}>
      <h1>{element}, at Affordable Range</h1>

      <img
        src={image}
        alt="Office Space"
        width="350"
        height="250"
      />

      <h2>Name : {office.Name}</h2>

      <h3
        style={{
          color: office.Rent <= 60000 ? "red" : "green"
        }}
      >
        Rent : Rs. {office.Rent}
      </h3>

      <h3>Address : {office.Address}</h3>

    </div>
  );
}

export default App;