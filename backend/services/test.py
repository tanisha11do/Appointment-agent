from backend.services.availability import check_availability

results = check_availability(
    specialisation="Cardiologist",
    location="Bengaluru",
    date="2026-02-09"
)

if results:
    for r in results:
        print(
            r["doctor_name"],
            r["start_time"],
            "-",
            r["end_time"],
            "=>",
            r["slot_status"]
        )

# print("\nSLOTS FOR DOCTOR 5:")
# slots = check_slot_availability(doctor_id=1, date="2026-02-08")
# for slot in slots:
#     print(slot)
