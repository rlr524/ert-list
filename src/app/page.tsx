import Image from "next/image";

export default function Home() {
	return (
		<main className="flex min-h-screen flex-col justify-between p-16">
			<div className="text-2xl">
				<p>Choose a Location</p>
				<form action="" method="post">
					<input
						className="mt-2 block border-1 text-lg focus:ring-0"
						type="text"
						name="location-search"
						id="location-search"
					/>
				</form>
			</div>
			<div className="text-2xl">View Location ERT</div>
			<div className="text-2xl">View Region ERT</div>
			<div className="text-2xl">View Corporate ERT</div>
		</main>
	);
}
